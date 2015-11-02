class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name, null:false
      t.string  :email, null:false
      t.string  :password_digest, null:false
      t.string  :career, null:false
      t.string  :gender, null:false
      t.integer :privilege, null:false
      t.string  :status, default: "Ativo"

      t.index :email, unique: true, name: 'idx_email_users'

      t.timestamps null: false
    end
  end
end
