# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#User.create(name: "JJ", password: "12345678", email: "jrabasco@brandeis.edu")

file = File.read('db/course.json')
course_hasher = JSON.parse(file)
course_hasher.each do |c|
  @new_course = Course.create(name: c["name"])
end

file = File.read('db/instructor.json')
inst_hasher = JSON.parse(file)
inst_hasher.each do |c|
  Instructor.create(name: c["last"])
end

file = File.read('db/subject.json')
sub_hasher = JSON.parse(file)
sub_hasher.each do |c|
  Subject.create(name: c["name"])
end
