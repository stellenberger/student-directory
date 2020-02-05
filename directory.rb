@students = []

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
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again."
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
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
  if @students.empty?
    puts 'You didnt input any students. Goodbye!'
    return
  end
  puts "Which students do you want to look up? Use a - z."
  puts "If you want to look at all students, type all"
  while true do
    choice = gets.chomp
    if choice == 'all'
      index = 0
      #code exercise to not use the each method and to create one using while loop
      #code exercise to only produce names under 12 characters long
      while index < @students.length
        if @students[index][:name].length < 12
          puts "#{index + 1}. #{@students[index][:name]} " +
          "(#{@students[index][:cohort]} cohort). "
        end
        index += 1
      end
      break
    elsif (choice.match(/[a-z]/)) && (choice.length == 1)
      index = 0
      #code exercise to not use the each method and to create one using while loop
      #code exercise to only produce names under 12 characters long
      while index < @students.length
        if (@students[index][:name][0] == choice.downcase) && (@students[index][:name].length < 12)
          puts "#{index + 1}. #{@students[index][:name]} " +
          "(#{@students[index][:cohort]} cohort). "
        end
        index += 1
      end
      break
    else
      puts 'That is not valid input'
    end
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
