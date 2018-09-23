
class TitleValidator < ActiveModel::Validator
  def validate(record)
    unless record.title.include? "Won't Believe" || record.title.include? 'Secret' || record.title.include? 'Top [number]' || record.title.include? 'Guess'
      record.errors[:title] << 'Title is not clickbait-y enough.'
    end
  end
end

class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true, title: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
end
