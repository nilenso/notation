class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    enable_extension "pgcrypto" unless extension_enabled?("pgcrypto")
    create_table :notes, id: :uuid do |t|
      t.string :title
      t.text :body
      t.references :user, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
