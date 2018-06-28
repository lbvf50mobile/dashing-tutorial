require "google_drive"

@session ||= GoogleDrive::Session.from_service_account_key("wg.json")
@spreadsheet = @session.spreadsheet_by_title("KUHL Dashboards")
@worksheet = @spreadsheet.worksheets.first

quicklook = DashApp::QuickLook.new(@worksheet)

send_event('visitors',   quicklook.to_hash([3,3]))
send_event('sales',   { value: @worksheet[4,5], persent: @worksheet[5,5]})
send_event('revenue',   { value: @worksheet[4,7], persent: @worksheet[5,7]})

send_event('visitors1',   { value: @worksheet[12,3], persent: @worksheet[13,3]})
send_event('sales1',   { value: @worksheet[12,5], persent: @worksheet[13,5]})
send_event('revenue1',   { value: @worksheet[12,7], persent: @worksheet[13,7]})

# Test 'Dos the jobs work when there is no connection?'
`touch linesNew`
`echo "Start experement." >> linesNew`
`echo '0' >> linesNew`



SCHEDULER.every '1m', :first_in => 0 do |job|
    @session ||= GoogleDrive::Session.from_service_account_key("wg.json")
    @spreadsheet = @session.spreadsheet_by_title("KUHL Dashboards")
    @worksheet = @spreadsheet.worksheets.first
  
    send_event('visitors',   { value: @worksheet[4,3], persent: @worksheet[5,3]})
    send_event('sales',   { value: @worksheet[4,5], persent: @worksheet[5,5]})
    send_event('revenue',   { value: @worksheet[4,7], persent: @worksheet[5,7]})

    send_event('visitors1',   { value: @worksheet[12,3], persent: @worksheet[13,3]})
    send_event('sales1',   { value: @worksheet[12,5], persent: @worksheet[13,5]})
    send_event('revenue1',   { value: @worksheet[12,7], persent: @worksheet[13,7]})

    # Test 'Does the jobs work hen there is not connection?'
    val = `tail -1 linesNew`
    val = val.to_i
    val += 1
    `echo #{val} >> linesNew`
end
