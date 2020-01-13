module SubjectsHelper
  def self.to_hour(int_time)
    if int_time < 10
      "0#{int_time}:00"
    else
      "#{int_time}:00"
    end
  end

  def to_hour(int_time)
    SubjectsHelper.to_hour(int_time)
  end
end
