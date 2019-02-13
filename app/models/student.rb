class Student < ApplicationRecord
  
  belongs_to :user
  
  mount_uploader :image, ImageUploader


  def self.search(search)

    # where (["student_name LIKE ? OR admission_no LIKE ?", "%#{search}%","%#{search}%"])  
    # where (["student_name LIKE ? OR admission_no LIKE ? OR class_applied LIKE ?", "%#{search}%","%#{search}%","%#{search}%"])
    # where (["student_name::text ILIKE ? OR admission_no::text ILIKE ?", "%#{search}%","%#{search}%"])
    where (["student_name::text ILIKE ? OR admission_no::text ILIKE ? OR class_applied::text ILIKE ?", "%#{search}%","%#{search}%","%#{search}%"])

  end


  # has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }, default_url: "/images/:style/missing.png"
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/



  def self.import(file, user)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      note = find_by_id(row["id"]) || new(user: user)
      note.attributes = row.to_hash.slice(*row.to_hash.keys)
      note.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Roo::CSV.new(file.path)
    when ".xls" then Roo::Excel.new(file.path)
    when ".xlsx" then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end 
  end

  

end

