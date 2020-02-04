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
          puts "#{index + 1}. #{students[index][:name]} " +
          "(#{students[index][:cohort]} cohort). " +
          "#{students[index][:hobby]} is their hobby, " +
          "they were born in #{students[index][:country_of_birth]} " +
          "and they are #{students[index][:height]} tall."
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
          puts "#{index + 1}. #{students[index][:name]} " +
          "(#{students[index][:cohort]} cohort) " +
          "#{students[index][:hobby]} is their hobby, " +
          "they were born in #{students[index][:country_of_birth]} " +
          "and they are #{students[index][:height]} tall."
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
  puts "Overall, we have #{students.count} great students"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    #code exercise to add hobbies
    puts "and that students hobby"
    hobby = gets.chomp
    #code exercise to add country of birth
    puts "and that students country of birth"
    country_of_birth = gets.chomp
    #code exercise to add height
    puts "and that students height"
    height = gets.chomp
    students << {name: name, cohort: :february, hobby: hobby, country_of_birth:
      country_of_birth, height: height}
    puts "Now we have #{students.count} students"
    puts "And the next students name:"
    name = gets.chomp
  end
  students
end

students = input_students
print_header
print(students)
print_footer(students)
