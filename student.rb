require_relative 'crud'
class Student
  include Crud
  attr_accessor :name,:section,:username,:password
  def initialize(name,section,username,password)
    @name = name
    @section=section
    @username=username
    @password=password
  end

  def to_s
    "Name: #{@name}, Section: #{@section}, Username: #{@username}, Password: #{@password}"
  end
end
s1=Student.new("student1","A","student_1","student1@")
s2=Student.new("student2","B","student_2","student2@")
# s3=Student.new("student3","C","student_3","student3@")
# s4=Student.new("student4","D","student_4","student4@")
# s5=Student.new("student5","E","student_5","student5@")

hashed1=s1.create_hash_digest(s1.password)
puts "Student1",hashed1
hashed2=s1.create_hash_digest(s2.password)
puts "Student2",hashed2

