class Mood < ApplicationRecord
	#to load the worksheet
	def self.worksheet
		@session ||= GoogleDrive::Session.from_service_account_key("lib/client.rb")
		@spreadsheet ||= @session.spreadsheet_by_title("Toy App")
		@worksheet ||= @spreadsheet.worksheets.first
	end

  #to perform update on database table
	def self.perform
    rows = worksheet.rows
    (1...rows.count).each do |row|
     if rows[row][2] == "skip" ||  rows[row][2] == "complete"
       mood = Mood.find_by(id: rows[row][0])
       if mood
         mood.input_url = rows[row][1]
         mood.status = rows[row][2]
         mood.output_url = rows[row][3]
         mood.save
       end
     end
    end
  end

  #to insert and update in sheet
  def insert_and_update(input_url)
    worksheet = Mood.worksheet
    worksheet.insert_rows(worksheet.num_rows+1,[input_url])
    if worksheet.save
    	input_url << "processed"
      worksheet.update_cells(worksheet.num_rows,1,[input_url])
    	self.status = "processed"
    	self.save
    	worksheet.save
  	end
  end

end
