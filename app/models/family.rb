class Family < ActiveRecord::Base
      has_many :people, :dependent => :destroy
end
