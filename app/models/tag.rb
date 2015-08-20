class Tag < ActiveRecord::Base
    def self.to_xls
	p = Axlsx::Package.new
	p.workbook.add_worksheet(name: 'Product Tags') do |sheet|
	    sheet.add_row ["Tag", "Date Generated"]

	    all.each do |tag|
		sheet.add_row [tag.value, tag.created_at]
	    end
	end

	filename = '/tmp/' + ('a'..'z').to_a.sample + ('0'..'9').to_a.sample + '.xls'
	p.serialize(filename)
	filename
    end
end
