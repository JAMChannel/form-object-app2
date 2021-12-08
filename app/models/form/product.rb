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
class Form::Product < Product
  REGISTRABLE_ATTRIBUTES = %i(register code name price)
  attr_accessor :register
end
