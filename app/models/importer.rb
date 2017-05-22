require "csv"

class Importer
  COLUMNS = %i(client description unit_price amount address supplier).freeze
  OPTIONS = {
    row_sep: "\n", col_sep: "\t", converters: %i(integer price)
  }.freeze

  attr_reader :import, :data

  CSV::Converters[:price] = lambda do |str|
    str =~ /^\d+\.\d+$/ ? (str.to_f * 100).to_i : str
  end

  def self.call(import:, data:)
    new(import: import, data: data).call
  end

  def initialize(import:, data:)
    @import = import
    @data = data
  end

  def call
    import.orders << orders
    import.success!
  rescue => e
    import.fail! message: e.message
  end

  private

  def orders
    Order.create! rows
  end

  def rows
    CSV.new(data, OPTIONS).map { |row| COLUMNS.zip(row).to_h }.drop(1)
  end
end
