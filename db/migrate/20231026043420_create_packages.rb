class CreatePackages < ActiveRecord::Migration[7.1]
  def change
    create_table :packages do |t|
      t.string :absender
      t.string :empfänger
      t.string :inhalt
      t.string :gewicht
      t.string :zielort

      t.timestamps
    end
  end
end
