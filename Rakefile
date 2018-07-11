require 'colorize'
# thanks for @EgorBazhenov
# alias x='rake widget["newwidget"]'
task :widget,[:name] => %i{with_args no_args} do |task,args|
    puts "Widget task".green
    p task
    p args
    p args[:name]
end
task :with_args,[:name] do |task, args|
    puts "With Args task".yellow
    p task
    p args
    p args[:name]
end
task :no_args do |task, args|
    puts "No Args tasks".red
    p task
    p args
    p args[:name]
end