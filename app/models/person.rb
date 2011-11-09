class Person < ActiveRecord::Base
  validates :first_name, :last_name, :family_role, :presence => true
  belongs_to :family
  has_many :assistants
  has_many :teachers
  has_one :student
end
