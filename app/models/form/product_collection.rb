class Form::ProductCollection
  include ActiveModel::Model
  DEFAULT_ITEM_COUNT = 5
  attr_accessor :products

  def initialize(attributes = {})
    super attributes
    self.products = DEFAULT_ITEM_COUNT.times.map { Form::Product.new } unless products.present?
  end

  def products_attributes=(attributes)
    self.products = attributes.map do |_, product_attributes|
      Form::Product.new(product_attributes)
    end
  end

  def valid?
    valid_products = target_products.map(&:valid?).all?
    super && valid_products
  end

  def save
    # Product.transaction do
    #   self. products.map(&:save!)
    # end
    #   return true
    # rescue => e
    #   return false
    return false unless valid?
    Product.transaction { target_products.each(&:save!) }
    true
  end

  def target_products
    self.products.select { |v| ActiveRecord::Type::Boolean.new.cast(v.register) }
    # ActiveRecord::ConnectionAdapters::Column.value_to_boolean(value)はrails 5から利用できない？
  end
end