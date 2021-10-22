class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, id: :uuid, default: "gen_random_uuid()" do |t|
      t.string :name
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
