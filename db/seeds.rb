require 'faker'

require_relative '../models/item.rb'
require_relative '../models/user.rb'

10.times do 
  Item.create(name: Faker::Construction.material)
end