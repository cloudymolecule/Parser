class CreateLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :logs do |t|
      t.string :source_ip
      t.string :dest_ip
      t.boolean :source_ip_valid
      t.boolean :dest_ip_valid
      t.boolean :source_ip_private
      t.boolean :dest_ip_private

      t.timestamps
    end
  end
end
