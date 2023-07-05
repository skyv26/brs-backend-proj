class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :full_name
      t.string :email_address
      t.date :date_of_birth
      t.string :mobile_no
      t.string :password
      t.string :profile_photo
      t.string :role
      t.string :security_question
      t.string :security_answer

      t.timestamps
    end
  end
end
