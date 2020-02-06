@students = []

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    # create a new array of the students name and cohort
    student_data = [student[:name], student[:cohort]]
    # turn that array into a string by joining it with a comma as argument.
    csv_line = student_data.join(",")
    # puts the string into the csv file
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    # parallel assignment. As its an array, first value goes in first variable,
    # and second value goes into second variable
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def interactive_menu
  loop do
    print_menu()
    process(gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    @students = input_students()
  when "2"
    show_students()
  when "3"
    save_students()
  when "4"
    load_students()
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again."
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header()
  print_students_list()
  print_footer()
end

def print_header
  puts 'The students of Villians Academy'
  puts '------------------'
end

def print_students_list()
  #code exercise to produce names starting with a particular letter.
  #I put user ability to choose this letter.
  check_if_students_is_empty()
  lookup_options()
  while true do
    choice = gets.chomp
    if choice == 'all'
      @students.each_with_index do |student, index|
          puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort). "
      end
      break
    elsif (choice.match(/[a-z]/)) && (choice.length == 1)
      @students.each_with_index do |student, index|
        if student[:name][0] == choice.downcase
          puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort). "
        end
      end
      break
    else
      puts 'That is not valid input'
    end
  end
end

def lookup_options
  puts "Which students do you want to look up? Use a - z."
  puts "If you want to look at all students, type all"
end

def check_if_students_is_empty
  if @students.empty?
    puts 'You didnt input any students. Goodbye!'
    exit
  end
end

def print_footer()
  if @students.length == 1
    puts "Overall, we have #{@students.count} great student"
  else
    puts "Overall, we have #{@students.count} great students"
  end
end

def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  name = gets.chomp
  while !name.empty? do
    puts "and the students cohort"
    cohort = gets.chomp.to_sym
    cohort = :february if cohort.empty?
    @students << {name: name, cohort: cohort}
    puts "Now we have #{@students.count} students"
    puts "And the next students name:"
    name = gets.chomp
  end
  @students.sort_by{|student| student[:cohort]}
end

interactive_menu()
