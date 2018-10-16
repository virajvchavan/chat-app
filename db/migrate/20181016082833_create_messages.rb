class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.references :from
      t.references :to

      t.timestamps
    end
  end
end
