class CreatePackages < ActiveRecord::Migration[7.1]
  def change
    create_table :packages do |t|
      t.string :sender
      t.string :recipient
      t.string :content
      t.string :weight
      t.string :destination

      t.timestamps
    end
  end
end
