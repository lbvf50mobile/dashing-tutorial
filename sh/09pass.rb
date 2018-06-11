require 'securerandom'
10.times { 
   pass =  10.times.each.reduce(""){|s,n| s << (Array(?a..?z) | Array(?0..?9)).sample}
   p pass
}