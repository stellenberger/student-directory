def print_header
  puts 'The students of Villians Academy'
  puts '------------------'
end

def print(students)
  puts "Which students do you want to look up? Use a - z."
  puts "If you want to look at all students, type all"
  while true do
    choice = gets.chomp
    if choice == 'all'
      students.each_with_index do |student, index|
        puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)" if student[:name].length < 12
      end
      break
    elsif (choice.match(/[a-z]/)) && (choice.length == 1)
      students.each_with_index do |student, index|
        if student[:name][0] == choice.downcase
          puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
        end
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
    students << {name: name, cohort: :february}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

students = input_students
print_header
print(students)
print_footer(students)
