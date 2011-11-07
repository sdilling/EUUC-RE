class Group < ActiveRecord::Base
  has_many :teachers
  has_many :assistants
  has_many :students
end
