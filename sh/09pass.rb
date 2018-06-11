require 'securerandom'
4.times { 
    p (SecureRandom.hex(2) + Array(?a..?z).sample + Array(?a..?z).sample).split.shuffle.join
}