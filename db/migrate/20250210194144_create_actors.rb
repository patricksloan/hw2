class CreateActors < ActiveRecord::Migration[7.1]
  def change
    create_table :actors do |t|
      t.string "actor_name"

      t.timestamps
    end
  end
end
