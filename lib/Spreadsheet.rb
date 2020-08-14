class Spreadsheet

    def save_as_spreadsheet
        session = GoogleDrive::Session.from_service_account_key("client_seccret.json")
        ws = session.spreadsheet_by_key("").worksheets[0]
        ws[1, 1] = @arr.first.keys[0]
        ws[1, 2] = @arr.first.keys[1]
        @arr.map.with_index{|hash,index|
          ws[index+2, 1] = hash['ville']
          ws[index+2, 2] = hash['email']
        }
        ws.save
      end  
      
end


 