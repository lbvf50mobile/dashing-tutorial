require "google_drive"

@session ||= GoogleDrive::Session.from_service_account_key("wg.json")
@spreadsheet = @session.spreadsheet_by_title("KUHL Dashboards")
@worksheet = @spreadsheet.worksheets.first

send_event('visitors',   { info: @worksheet[4,3], persent: @worksheet[5,3]})
send_event('sales',   { info: @worksheet[4,5], persent: @worksheet[5,5]})
send_event('revenue',   { info: @worksheet[4,7], persent: @worksheet[5,7]})

send_event('visitors1',   { info: @worksheet[12,3], persent: @worksheet[13,3]})
send_event('sales1',   { info: @worksheet[12,5], persent: @worksheet[13,5]})
send_event('revenue1',   { info: @worksheet[12,7], persent: @worksheet[13,7]})


SCHEDULER.every '1m', :first_in => 0 do |job|
    @session ||= GoogleDrive::Session.from_service_account_key("wg.json")
    @spreadsheet = @session.spreadsheet_by_title("KUHL Dashboards")
    @worksheet = @spreadsheet.worksheets.first
  
    send_event('visitors',   { info: @worksheet[4,3], persent: @worksheet[5,3]})
    send_event('sales',   { info: @worksheet[4,5], persent: @worksheet[5,5]})
    send_event('revenue',   { info: @worksheet[4,7], persent: @worksheet[5,7]})

    send_event('visitors1',   { info: @worksheet[12,3], persent: @worksheet[13,3]})
    send_event('sales1',   { info: @worksheet[12,5], persent: @worksheet[13,5]})
    send_event('revenue1',   { info: @worksheet[12,7], persent: @worksheet[13,7]})
end
