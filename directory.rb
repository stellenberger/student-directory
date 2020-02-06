@students = []

def interactive_menu
  loop do
    print_menu()
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_successful_message("1")
    @students = input_students()
  when "2"
    input_successful_message("2")
    show_students()
  when "3"
    input_successful_message("3")
    save_students()
  when "4"
    input_successful_message("4")
    load_students()
  when "9"
    input_successful_message("9")
    exit
  else
    puts "I don't know what you meant, try again."
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file of your choice"
  puts "4. Load a list from a file of your choice"
  puts "9. Exit"
end

def save_students
  puts "Please enter a file name you wish to save to."
  file_choice = STDIN.gets.chomp
  file = File.open(file_choice, "w")
  @students.each do |student|
    # create a new array of the students name and cohort
    student_data = [student[:name], student[:cohort]]
    # turn that array into a string by joining it with a comma as argument.
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  puts "Enter a file that you would like to load students from."
  filename = STDIN.gets.chomp
  file = File.open(filename, "r")
  file.readlines.each do |line|
    # parallel assignment. As its an array, first value goes in first variable,
    # and second value goes into second variable
    name, cohort = line.chomp.split(',')
    student_array_push(name, cohort)
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "loaded #{@students.count} from #{filename}"
  else
    puts "sorry, #{filename} doesnt exist."
    exit
  end
end

def student_array_push(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def input_successful_message(number)
  puts "You chose #{number}"
  puts "Goodbye! Have a lovely day" if number.to_i == 9
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

def print_student(student, index)
  puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)."
end

def print_students_list()
  check_if_students_is_empty()
  lookup_options()
  while true do
    choice = STDIN.gets.chomp
    if choice == 'all'
      @students.each_with_index do |student, index|
          print_student(student, index)
      end
      break
    elsif (choice.match(/[a-z]/)) && (choice.length == 1)
      @students.each_with_index do |student, index|
        if student[:name][0] == choice.downcase
          print_student(student, index)
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

def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    puts "and the students cohort"
    cohort = STDIN.gets.chomp.to_sym
    cohort = :february if cohort.empty?
    student_array_push(name, cohort)
    puts "Now we have #{@students.count} students"
    puts "And the next students name:"
    name = STDIN.gets.chomp
  end
  @students.sort_by{|student| student[:cohort]}
end

def print_footer()
  if @students.length == 1
    puts "Overall, we have #{@students.count} great student"
  else
    puts "Overall, we have #{@students.count} great students"
  end
end

try_load_students()
interactive_menu()
