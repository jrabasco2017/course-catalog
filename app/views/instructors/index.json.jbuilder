json.array!(@Instructors) do |instructor|
  json.extract! instructor, :first, :last, :ident
  json.url instructor_url(instructor, format: :json)
end
