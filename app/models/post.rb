
class TitleValidator < ActiveModel::Validator
  def validate(record)
    unless record.include? "Won't Believe" || record.include? 'Secret' || record.include? 'Top [number]' || record.include? 'Guess'
      record.errors[:title] << 'Title is not clickbait-y enough.'
    end
  end
end

class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validate(:title)
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
end
