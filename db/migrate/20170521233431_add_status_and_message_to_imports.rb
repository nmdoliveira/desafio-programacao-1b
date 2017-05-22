class AddStatusAndMessageToImports < ActiveRecord::Migration
  def change
    add_column :imports, :status, :integer
    add_column :imports, :message, :string
  end
end
