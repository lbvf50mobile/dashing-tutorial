salt = DashApp::Weather.new("salt")
nsk = DashApp::Weather.new("nsk")

salt.update
nsk.update
current_wiether_salt = salt.temperature
current_wiether_nsk = nsk.temperature

SCHEDULER.every '2s' do
  last_wiether_salt = current_wiether_salt
  last_wiether_nsk = current_wiether_nsk
  current_wiether_salt = salt.temperature
  current_wiether_nsk  = nsk.temperature

  # send_event('valuation', { current: current_valuation, last: last_valuation })
  # send_event('karma', { current: current_karma, last: last_karma })
  send_event('wiether_salt',   { current: current_wiether_salt, last: last_wiether_salt })
  send_event('wiether_nsk',   { current: current_wiether_nsk, last: last_wiether_nsk})
end