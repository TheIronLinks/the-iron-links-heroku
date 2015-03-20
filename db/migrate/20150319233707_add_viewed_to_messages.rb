class AddViewedToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :viewed, :boolean, default: false
    add_column :messages, :message_type, :string
  end
end
