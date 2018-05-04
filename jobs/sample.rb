current_wiether_salt = 0
current_wiether_nsk = 0

SCHEDULER.every '2s' do
  last_wiether_salt = current_wiether_salt
  last_wiether_nsk     = current_wiether_nsk
  current_wiether_salt = rand(20)
  current_wiether_nsk     = rand(20)

  # send_event('valuation', { current: current_valuation, last: last_valuation })
  # send_event('karma', { current: current_karma, last: last_karma })
  send_event('wiether_salt',   { current: current_wiether_salt, last: last_wiether_salt })
  send_event('wiether_nsk',   { current: current_wiether_nsk, last: last_wiether_nsk})
end