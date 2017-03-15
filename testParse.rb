require 'json'

file = File.read('course.json')
data_hash = JSON.parse(file)
data_hash.each do |inner|
    inner.keys.each do |keyer|
      if keyer == "name"
        print inner[keyer]
      end
    end
  end
end
