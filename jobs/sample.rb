salt = DashApp::Weather.new("Salt Lake City")
nsk = DashApp::Weather.new("Novosibirsk")


current_wiether_salt = salt.temperature
current_wiether_nsk = nsk.temperature

SCHEDULER.every '30s' do
  salt.update
  nsk.update
  last_wiether_salt = current_wiether_salt
  last_wiether_nsk = current_wiether_nsk
  current_wiether_salt = salt.temperature
  current_wiether_nsk  = nsk.temperature
  send_event('wiether_salt',   { current: current_wiether_salt, last: last_wiether_salt })
  send_event('wiether_nsk',   { current: current_wiether_nsk, last: last_wiether_nsk})
end