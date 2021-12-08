# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  code       :string(10)       not null
#  name       :string(50)       not null
#  price      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Product < ApplicationRecord
  validates :code, presence: true, length: { maximum: 10 }
  validates :name, presence: true, length: { maximum: 50 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :code, uniqueness: { message: 'が重複してます' }

end
