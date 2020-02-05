def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      students = input_students()
    when "2"
      print_header()
      print(students)
      print_footer(students)
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again."
    end
  end
end

def print_header
  puts 'The students of Villians Academy'
  puts '------------------'
end

def print(students)
  #code exercise to produce names starting with a particular letter.
  #I put user ability to choose this letter.
  if students.empty?
    puts 'You didnt input any students. Goodbye!'
    return
  end
  puts "Which students do you want to look up? Use a - z."
  puts "If you want to look at all students, type all"
  while true do
    choice = gets[0..-2]
    if choice == 'all'
      index = 0
      #code exercise to not use the each method and to create one using while loop
      #code exercise to only produce names under 12 characters long
      while index < students.length
        if students[index][:name].length < 12
          puts ("#{index + 1}. #{students[index][:name]} " +
          "(#{students[index][:cohort]} cohort). " +
          "\n hobby: #{students[index][:hobby]} " +
          "\n country of birth: #{students[index][:country_of_birth]} " +
          "\n height: #{students[index][:height]} tall.").center(20)
        end
        index += 1
      end
      break
    elsif (choice.match(/[a-z]/)) && (choice.length == 1)
      index = 0
      #code exercise to not use the each method and to create one using while loop
      #code exercise to only produce names under 12 characters long
      while index < students.length
        if (students[index][:name][0] == choice.downcase) && (students[index][:name].length < 12)
          puts ("#{index + 1}. #{students[index][:name]} " +
          "(#{students[index][:cohort]} cohort). " +
          "\n hobby: #{students[index][:hobby]} " +
          "\n country of birth: #{students[index][:country_of_birth]} " +
          "\n height: #{students[index][:height]} tall.").center(20)
        end
        index += 1
      end
      break
    else
      puts 'That is not valid input'
    end
  end
end

def print_footer(students)
  if students.length == 1
    puts "Overall, we have #{students.count} great student"
  else
    puts "Overall, we have #{students.count} great students"
  end
end

def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  students = []
  name = gets[0..-2]
  while !name.empty? do
    puts "and the students cohort"
    cohort = gets[0..-2].to_sym
    cohort = :february if cohort.empty?
    #code exercise to add hobbies
    puts "and that students hobby"
    hobby = gets[0..-2]
    #code exercise to add country of birth
    puts "and that students country of birth"
    country_of_birth = gets[0..-2]
    #code exercise to add height
    puts "and that students height"
    height = gets[0..-2]
    students << {name: name, cohort: cohort, hobby: hobby, country_of_birth:
      country_of_birth, height: height}
    puts "Now we have #{students.count} students"
    puts "And the next students name:"
    name = gets[0..-2]
  end
  students.sort_by{|student| student[:cohort]}
end

interactive_menu()
