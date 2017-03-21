json.array!(@courses) do |course|
  json.extract! course, :name, :idep, :subjects
  json.url course_url(course, format: :json)
end
