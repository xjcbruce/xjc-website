class City < ActiveRecord::Base

  default_scope { where visible: 1 }
  scope :provinces, -> { where level: 1 }

  def self.sub_cities(father_gb_code)
    where("father_gb_code = ?", father_gb_code)
  end

  def self.gb_code_to_name(gb_code)
    city = City.find_by gb_code: gb_code
    city.nil? ? '' : city.name
  end

end
