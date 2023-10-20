class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :password_confirmation
      t.string :email
      t.string :address
      t.string :telnr

      t.timestamps
    end
  end
end
