class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :name
      t.date :birth_date
      t.string :email
      t.float :weight
      t.float :height
      t.string :gender
      t.float :bmi

      t.timestamps
    end
  end
end
