class CreateNonprofits < ActiveRecord::Migration[7.0]
  def change
    create_table :nonprofits do |t|
      t.string :registry_number
      t.string :business_name
      t.string :entity_type
      t.string :registry_date
      t.string :nonprofit_type
      t.string :associated_name_type
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :suffix
      t.string :not_of_record_entity
      t.string :entity_of_record_reg_number
      t.string :entity_of_record_name
      t.string :address
      t.string :address_continued
      t.string :city
      t.string :state
      t.string :zip_code
    end
  end
end
