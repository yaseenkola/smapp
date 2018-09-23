class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :admission_no
      t.date :admission_date
      t.string :student_name
      t.string :surname
      t.string :class_applied
      t.integer :age
      t.date :dob
      t.string :pob
      t.integer :card_no
      t.string :gender
      t.string :father_name
      t.string :occupation
      t.string :qualification
      t.string :mob_no
      t.string :email
      t.string :address
      t.string :mother_name
      t.string :m_occupation
      t.string :m_qualification
      t.string :specialist
      t.string :m_address
      t.string :m_mob
      t.string :m_email
      t.string :whats_app
      t.string :req_trans
      t.string :trans_addr
      t.string :remarks
      t.attachment :image
      
      t.timestamps
    end
  end
end
