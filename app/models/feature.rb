class Feature < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true, allow_blank: true
  validates_associated :project, on: :update

  belongs_to :project
end
