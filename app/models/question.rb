class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  belongs_to :lesson
end
