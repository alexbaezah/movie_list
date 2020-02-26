class Movie < ApplicationRecord

    scope :done, lambda{where(favorite: :true)}

    scope :undone, lambda{where(favorite: :false)}

    has_and_belongs_to_many :tags
  
end
