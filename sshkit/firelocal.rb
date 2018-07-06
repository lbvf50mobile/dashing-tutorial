require 'sshkit'
require 'sshkit/dsl'
include SSHKit::DSL

run_locally do
    puts capture 'pwd'
  end
  