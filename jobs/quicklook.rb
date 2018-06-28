require "google_drive"

@session ||= GoogleDrive::Session.from_service_account_key("wg.json")
@spreadsheet = @session.spreadsheet_by_title("KUHL Dashboards")
@worksheet = @spreadsheet.worksheets.first

quicklook = DashApp::QuickLook.new(@worksheet)
send_event('visitors',   quicklook.to_hash([3,?C]))
send_event('sales',   quicklook.to_hash([3,?E]))
send_event('revenue',   quicklook.to_hash([3,?G]))
send_event('visitors1',   quicklook.to_hash([11,?C]))
send_event('sales1',   quicklook.to_hash([11,?E]))
send_event('revenue1',   quicklook.to_hash([11,?G]))

SCHEDULER.every '1m', :first_in => 0 do |job|
    @session ||= GoogleDrive::Session.from_service_account_key("wg.json")
    @spreadsheet = @session.spreadsheet_by_title("KUHL Dashboards")
    @worksheet = @spreadsheet.worksheets.first

    quicklook = DashApp::QuickLook.new(@worksheet)
    send_event('visitors',   quicklook.to_hash([3,?C]))
    send_event('sales',   quicklook.to_hash([3,?E]))
    send_event('revenue',   quicklook.to_hash([3,?G]))
    send_event('visitors1',   quicklook.to_hash([11,?C]))
    send_event('sales1',   quicklook.to_hash([11,?E]))
    send_event('revenue1',   quicklook.to_hash([11,?G]))
end
