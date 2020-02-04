def print_header
  puts 'The students of Villians Academy'
  puts '------------------'
end

def print(students)
  #code exercise to produce names starting with a particular letter.
  #I put user ability to choose this letter.
  puts "Which students do you want to look up? Use a - z."
  puts "If you want to look at all students, type all"
  while true do
    choice = gets.chomp
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
  name = gets.chomp
  while !name.empty? do
    puts "and the students cohort"
    cohort = gets.chomp.to_sym
    cohort = :february if cohort.empty?
    #code exercise to add hobbies
    puts "and that students hobby"
    hobby = gets.chomp
    #code exercise to add country of birth
    puts "and that students country of birth"
    country_of_birth = gets.chomp
    #code exercise to add height
    puts "and that students height"
    height = gets.chomp
    students << {name: name, cohort: cohort, hobby: hobby, country_of_birth:
      country_of_birth, height: height}
    puts "Now we have #{students.count} students"
    puts "And the next students name:"
    name = gets.chomp
  end
  students.sort_by{|student| student[:cohort]}
end

students = input_students()
print_header
print(students)
print_footer(students)
