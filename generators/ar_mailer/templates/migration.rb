class <%= migration_name %> < ActiveRecord::Migration
  def self.up
    create_table :<%= table_name %> do |t|
      t.column :from, :string
      t.column :to, :string
      t.column :last_send_attempt, :integer, :default => 0
      t.column :mail, :text
      t.column :created_on, :datetime
    end
  end

  def self.down
    drop_table :<%= table_name %>
  end
end
