
require "google_drive"

SCHEDULER.every '1m', :first_in => 0 do |job|
    @session ||= GoogleDrive::Session.from_service_account_key("wg.json")
    @spreadsheet = @session.spreadsheet_by_title("KUHL Dashboards")
    @worksheet = @spreadsheet.worksheets.first
    @val = @worksheet[4,2]
  send_event('google_spreadsheet', { value: @val  })
end