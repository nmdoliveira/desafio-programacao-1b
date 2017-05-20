class ImportOrders
  COLUMNS = %i[client description unit_price amount address supplier].freeze

  attr_reader :content

  def self.call(content:)
    new(content: content).call
  end

  def initialize(content:)
    @content = content.force_encoding("utf-8")
  end

  def call
    Order.create!(data)
  end

  private

  def data
    content.lines.drop(1).map { |line| parse line }
  end

  def parse(line)
    values(line).tap do |hash|
      hash[:unit_price] = parse_price(hash[:unit_price])
      hash[:amount] = hash[:amount].to_i
    end
  end

  def values(line)
    COLUMNS.zip(line.chomp.split("\t").map(&:squish)).to_h
  end

  def parse_price(string)
    price, cents = string.split(".").map(&:to_i)
    price * 100 + cents
  end
end
