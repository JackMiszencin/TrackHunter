class ConvertZipCodeToZip < ActiveRecord::Migration
  def up
  	add_column :merchants, :zip, :string
  	Merchant.all.each do |m|
  		m.zip = m.format_zip  		
  		m.save
  	end
  end

  def down
  	raise ActiveRecord::IrreversibleMigration
  end
end
