
class TitleValidator < ActiveModel::Validator
  def validate(record)
    unless record.title.include? "Won't Believe" || record.title.include? 'Secret' || record.title.include? 'Top [number]' || record.title.include? 'Secret'
      record.errors[:name] << 'Need a name starting with X please!'
    end
  end
end

class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
end
