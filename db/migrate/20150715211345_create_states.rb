class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :abbrev, null: false
    end
    add_index :states, :abbrev, unique: true
  end
end
