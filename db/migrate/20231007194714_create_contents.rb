class CreateContents < ActiveRecord::Migration[7.0]
  def change
    create_table :contents do |t|
      t.references :product, null: true, foreign_key: true
      t.string     :name
      t.text       :description

      t.timestamps
    end
  end
end
