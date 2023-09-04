# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

require 'csv'

# Specify the file path
csv_file_path = Rails.root.join('db', 'data.csv')

# Open and read the file
CSV.foreach(csv_file_path, headers: true).with_index do |row, index|
  # Skip the first row if desired (index starts from 0)
  next if index == 0

  

  # Create a new Nonprofit record
  nonprofit = Nonprofit.find_or_initialize_by(
    registry_number: row['Registry Number'],
    business_name: row['Business Name'],
    entity_type: row['Entity Type'],
    registry_date: row['Registry Date'],
    nonprofit_type: row['Nonprofit Type'],
    associated_name_type: row['Associated Name Type'],
    first_name: row['First Name'],
    middle_name: row['Middle Name'],
    last_name: row['Last Name'],
    suffix: row['Suffix'],
    not_of_record_entity: row['Not of Record Entity'],
    entity_of_record_reg_number: row['Entity of Record Reg Number'],
    entity_of_record_name: row['Entity of Record Name'],
    address: row['Address'],
    address_continued: row['Address Continued'],
    city: row['City'],
    state: row['State'],
    zip_code: row['Zip Code']
  )

  nonprofit.save!
end

