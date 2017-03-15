require 'json'

file = File.read('course.json')
data_hash = JSON.parse(file)
Course.create(:id=> "a", :code => "cop", :name => "This sucks")
counterOne = 0
counterTwo = 0
counterThree=0
counter =0
ider = ""
coder = ""
namer = ""
data_hash.keys.each do |keyer|
  if counterOne == 1
    ider = data_hash[keyer]
    counterOne =0
  end
  if counterTwo == 1
      coder == data_hash[keyer]
      counterTwo=0
  end
  if counterThree ==1
    namer = data_hash[keyer]
    counterThree=0
  end
  if data_hash[keyer] == "id"
    counterOne=1
  elsif data_hash[keyer] == "code"
    counterTwo = 1
  elsif data_hash[keyer] == "Name"
    counterThree = 1
  end
  if data_hash[keyer] == "type"
    object = Course.new(:id=> ider, :code => coder, :name => namer)
    object.save
  end
end
