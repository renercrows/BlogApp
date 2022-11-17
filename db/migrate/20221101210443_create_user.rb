class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.text :photo, default: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgGzZ0z42r96DLQES7kolpBPw5xM2UqS04GKKYyZiF&s'
      t.text :bio

      t.timestamps
    end
  end
end
