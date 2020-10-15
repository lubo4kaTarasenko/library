class CreatePromocodes < ActiveRecord::Migration[6.0]
  def change
    create_table :promocodes do |t|
      t.string :code
      t.boolean :used

      t.timestamps
    end
  end
end
