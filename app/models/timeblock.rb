class Timeblock < ApplicationRecord
  belongs_to :user 
  has_and_belongs_to_many :journeys
  has_and_belongs_to_many :subtasks
end
