class CreateFastcars < ActiveRecord::Migration[5.2]
  def change
    create_table :fastcars do |t|

      t.string :make
      t.string :model
      t.text :image
      t.float :quatermile
      t.float :topspeed
      t.float :kilowatts

    end
  end
end
