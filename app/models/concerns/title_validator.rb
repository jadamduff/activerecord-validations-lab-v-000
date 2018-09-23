class TitleValidator < ActiveModel::Validator
  def validate(record)
    unless record[:title].include? "Won't Believe" || record[:title] == nil
      record.errors[:title] << 'Title not valid.'
    end
  end
end
