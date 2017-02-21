require 'rails_helper'

RSpec.describe City, type: :model do

  describe "城市操作" do

    it "获取所有省份" do
      City.provinces.each do |province|
        printf "#{province.name}, #{province.gb_code}\n"
        expect(province.father_gb_code).to eq(nil)
        expect(province.level).to eq(1)
      end
    end

    it "获取下级行政区划" do
      father_gb_code = City.provinces.first.gb_code
      cities = City.sub_cities(father_gb_code)
      printf "Cities JSON: #{cities.to_json}"
      cities.each do |city|
        printf "#{city.name}, #{city.gb_code}\n"
        expect(city.father_gb_code).to eq(father_gb_code)
      end
    end

    it "获取下级城市, 父城市编码不存在" do
      result = City.sub_cities "111111"
      expect(result).not_to eq(nil)
      expect(result.size).to eq(0)
    end

  end


end
