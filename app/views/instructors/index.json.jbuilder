json.array!(@Instructors) do |instructor|
  json.extract! instructor, :name
  json.url instructor_url(instructor, format: :json)
end
