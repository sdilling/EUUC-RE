class Person < ActiveRecord::Base
  belongs_to :family
  has_many :assistants
  has_many :teachers
  has_one :student
end
