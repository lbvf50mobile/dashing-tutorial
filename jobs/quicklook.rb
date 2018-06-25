require "google_drive"

rows_= %w{water_drank pull_ups squats hip_flexor_stretch push_ups words_written}
y_offset=2 # row offset

SCHEDULER.every '1m', :first_in => 0 do |job|
    @session ||= GoogleDrive::Session.from_service_account_key("wg.json")
    @spreadsheet = @session.spreadsheet_by_title("KUHL Dashboards")
    @worksheet = @spreadsheet.worksheets.first
  
    send_event('visitors',   { info: @worksheet[4,3], persent: @worksheet[5,3]})
  
end