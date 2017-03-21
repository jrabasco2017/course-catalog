json.array!(@enrolls) do |enroll|
  json.extract! enroll, :id, :course
  json.url enroll_url(enroll, format: :json)
end
