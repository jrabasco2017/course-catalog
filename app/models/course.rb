class Course < ApplicationRecord
  has_and_belongs_to_many :enrollments
  has_many :users, through: :enrollments

  def self.search(search, searcher)
    theEntries = Search.all
    theEntries.where(["keys LIKE ? AND linked LIKE ?", "%#{search}%","%#{searcher}%"])
  end
end
