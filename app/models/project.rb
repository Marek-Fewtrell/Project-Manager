class Project < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true, allow_blank: true
  validates :dev_env, presence: true, allow_blank: true
  validates :prod_env, presence: true, allow_blank: true
  validates :language_desc, presence: true, allow_blank: true

  has_many :task, dependent: :destroy
end
