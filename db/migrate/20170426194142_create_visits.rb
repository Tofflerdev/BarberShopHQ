class CreateVisits < ActiveRecord::Migration[5.0]
  def change
    create_table :visit do |t|

      t.text :name
      t.text :phone
      t.text :date
      t.timestamps

    end  
  end
end
