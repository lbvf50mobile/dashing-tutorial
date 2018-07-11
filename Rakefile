require 'colorize'
# alias x='rake widget["newwidget"]'

# [:black, :light_black, :red, :light_red, :green, 
# :light_green, :yellow, :light_yellow, :blue,
# :light_blue, :magenta, :light_magenta, :cyan, :light_cyan, :white, :light_white, :default]

Name = {name: nil, small: nil, big: nil}
def set_name(name = nil)
    if name
        Name[:name] ||= name
        Name[:small] ||= name.downcase
        Name[:big] ||= name.capitalize
    end
    raise "Please add name argument for the rake taks" unless Name[:name]
    Name[:name]
end


task :widget,[:name] => %w{ smashing:scss smashing:html smashing:coffee} do |task,args|
    puts "Create Widget".green

    args[:name]
end


namespace :smashing do
    task :scss do
        puts "Create scss file".magenta
    end
    task :html do
        puts "Create html file".magenta
    end
    task :coffee do
        puts "Create coffee file".magenta
    end
end