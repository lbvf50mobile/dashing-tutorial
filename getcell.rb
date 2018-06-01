
require "google_drive"
@session ||= GoogleDrive::Session.from_service_account_key("wg.json")
@spreadsheet ||= @session.spreadsheet_by_title("wg001")
@worksheet ||= @spreadsheet.worksheets.first
p @worksheet

