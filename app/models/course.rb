class Course < ApplicationRecord
  has_and_belongs_to_many :enrollments
  has_many :users, through: :enrollments

  def self.search(search, search_column)
    theEntries = Course.all
    indicOne =0
    indicTwo =0
    theEntries =  theEntries.where(["name LIKE ?", "%#{search}%"])
    theEntries =  theEntries.where(["subjects LIKE ?", "%#{search_column}%"])
    return theEntries
  end
end
