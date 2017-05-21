class OrderImport < ActiveRecord::Base
  belongs_to :order
  belongs_to :import
end
