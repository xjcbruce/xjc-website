class City < ActiveRecord::Base

  default_scope { where visible: 1 }
  scope :provinces, -> { where level: 1 }

  def self.sub_cities(father_gb_code)
    where("father_gb_code = ?", father_gb_code)
  end

end
