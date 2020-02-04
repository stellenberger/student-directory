students = [
  {name: "Dr. Hannibal Lecter", cohort: :february},
  {name: "Darth Vader", cohort: :february},
  {name: "Nurse Ratched", cohort: :february},
  {name: "Michael Corleone", cohort: :february},
  {name: "Alex DeLarge", cohort: :february},
  {name: "The Wicked Witch of the West", cohort: :february},
  {name: "Terminator", cohort: :february},
  {name: "Freddy Krueger", cohort: :february},
  {name: "The Joker", cohort: :february},
  {name: "Joffrey Baratheon", cohort: :february},
  {name: "Norman Bates", cohort: :february}
]

def print_header
  puts 'The students of Villians Academy'
  puts '------------------'
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

print_header
print(students)
print_footer(students)
