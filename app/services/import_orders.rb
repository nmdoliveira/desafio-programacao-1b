require "csv"

class ImportOrders
  COLUMNS = %i[client description unit_price amount address supplier].freeze

  attr_reader :data

  CSV::Converters[:price] = lambda do |str|
    str =~ /^\d+\.\d+$/ ? (str.to_f * 100).to_i : str
  end

  def self.call(data:)
    new(data: data).call
  end

  def initialize(data:)
    @data = data.force_encoding("utf-8")
  end

  def call
    Order.create! rows
  end

  private

  def rows
    values.drop(1).map { |values| COLUMNS.zip(values).to_h }
  end

  def values
    CSV.parse data, row_sep: "\n", col_sep: "\t", converters: %i[integer price]
  end
end
