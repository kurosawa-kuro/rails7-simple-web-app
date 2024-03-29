class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.boolean :is_admin
      t.string :avatar

      t.timestamps
    end
  end
end
