require 'roo'
require 'carrierwave/orm/activerecord'

class Product < ActiveRecord::Base

    belongs_to :category
    belongs_to :account

    mount_uploader :qr_code, QrCodeUploader

    def self.import(file)
	product_ids = []
	spreadsheet = open_spreadsheet file
	header = spreadsheet.row(1)
	
	(2..spreadsheet.last_row).each do |i|
	    row = Hash[[header, spreadsheet.row(i)].transpose]
	    product = find_by_id(row["id"]) || new
	    puts row.to_hash.slice(:name)
	    product.attributes = row
	    product.save!
	    product_ids << product.id
	end

	where(id: product_ids).order :id
    end

    def self.open_spreadsheet(file)
	case File.extname(file.original_filename)
	    when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
	    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
	    when ".xlsx" then Roo::Spreadsheet.open(file.path, extension: :xlsx)

	    else raise "Unknown file type: #(file.original_filename}"
	end
    end

    def self.updateable_params
	[:name, :manufacturerproducer, :supplier, :retailer, :tag]
    end

    def add_tag(min = 1000000000, max =  9999999999)
	self.tag = Random.new.rand(min...max).to_s	
    end
end
