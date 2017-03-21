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
  subArray = Array.new()
  c["subjects"].each do |innerC|
    oner = innerC["id"]
    subArray.append(oner)
  end
  @new_course = Course.create(name: c["name"], idep: c["code"], subjects: subArray.join(","))
end

file = File.read('db/instructor.json')
inst_hasher = JSON.parse(file)
inst_hasher.each do |c|
  Instructor.create(first: c["first"], last: c["last"], ident: c["id"])
end

file = File.read('db/subject.json')
sub_hasher = JSON.parse(file)
sub_hasher.each do |c|
  @new_subject = Subject.create(name: c["name"], ider: c["id"])
end

file = File.read('db/course.json')
filer = File.read('db/subject.json')
suber_hasher = JSON.parse(filer)
cour_hasher = JSON.parse(file)
cour_hasher.each do |c|
  temper = c["name"]
  subberArray = Array.new()
  suber_hasher.each do |innerC|
    c["subjects"].each do |innestC|
      if innestC["id"] == innerC["id"]
        subberArray.append(innerC["name"])
      end
    end
  end
  Search.create(key: temper, linked: subberArray.join(","))
end
