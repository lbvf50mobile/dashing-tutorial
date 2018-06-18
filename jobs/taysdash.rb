
require "google_drive"

rows= %w{water_drank pull_ups squats hip_flexor_stretch push_ups words_written}
y_offset=2 # row offset

SCHEDULER.every '1m', :first_in => 0 do |job|
    @session ||= GoogleDrive::Session.from_service_account_key("wg.json")
    @spreadsheet = @session.spreadsheet_by_title("Tays Dash")
    @worksheet = @spreadsheet.worksheets.first

    rows.each_with_index{|name,row|
    left =  @worksheet[row+y_offset,3]
    done = @worksheet[row+y_offset,2]
    done = done.empty? ? 0 : done.to_i
    left = left.empty? ? 0 : left.to_i
    val = (done * 100) / left
    val |= 1
    send_event(name,   { value: val })
    
  }
   
  
end