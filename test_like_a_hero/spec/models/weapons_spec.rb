require 'rails_helper'
require 'weapons'

RSpec.describe Weapons, type: :model do

    it 'is invalid if the level is not between 1 and 99' do
      weapon = build(:weapons, level: Random.rand(100..9999))
      expect(weapon).to_not be_valid
    end

    it 'is invalid if the power_step is not equal 100' do
      weapon1 = build(:weapons, power_step: Random.rand(1..99))
      weapon2 = build(:weapons, power_step: Random.rand(101..99999))
      expect(weapon1).to_not be_valid
      expect(weapon2).to_not be_valid
    end

    it 'is invalid if the power_base is not greater than or equal to 3000' do
      weapon = build(:weapons, power_base: Random.rand(0..2999))
      expect(weapon).to_not be_valid
    end 

    it 'returns the correct current_power' do
      level = Random.rand(1..99)
      power_base = Random.rand(3000..999999)
      power_step = 100
      weapon = build(:weapons, level: level, power_base: power_base, power_step: power_step)
      current_power = (power_base + ((level-1) * power_step))

      expect(weapon.current_power).to eq(current_power)
    end

    it 'returns the correct title' do
      name = FFaker::Name.name
      level = Random.rand(1..99)
      weapon = build(:weapons, name: name, level: level)

      expect(weapon.title).to eq("#{name}##{level}")
    end  
    
end