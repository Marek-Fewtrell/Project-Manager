class Project < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  #validates :dev_env, allow_blank: true
  #validates :prod_env,  allow_blank: true
  #validates :language_desc, allow_blank: true

  has_many :task, dependent: :destroy
  has_many :feature, dependent: :destroy
end
