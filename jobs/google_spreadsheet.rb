
require "google_drive"

SCHEDULER.every '1m', :first_in => 0 do |job|

  send_event('google_spreadsheet', { value: 111  })
end