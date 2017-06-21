class CreateRdvs < ActiveRecord::Migration[5.0]
  def change
    create_table :rdvs do |t|
      t.string :name
      t.string :phone_number
      t.datetime :time

      t.timestamps
    end
  end
end
