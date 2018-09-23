class TitleValidator < ActiveModel::Validator
  def validate(record)
    unless record.title.include? "Won't Believe"
      record.errors[:title] << 'Title is not clickbait-y enough.'
    end
  end
end
