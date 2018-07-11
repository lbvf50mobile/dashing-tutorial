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
def filename
    "widgets/#{Name[:small]}/#{Name[:small]}"
end


desc "Create Smasghing widget in /widgets diretory"
task :widget,[:name] => %w{ smashing:scss smashing:html smashing:coffee} do |task,args|
    set_name(args[:name])
    puts "Create Widget: #{Name[:name]}".green

    
end


namespace :smashing do
    desc "Create scss file for widget"
    task :scss, [:name] do |task, args|
        set_name(args[:name])
        puts "Create scss file: #{filename}".magenta
    end
    desc "Create html file for widget"
    task :html, [:name] do |task, args|
        set_name(args[:name])
        puts "Create html file: #{filename}".magenta
    end
    desc "Create coffie file for widget"
    task :coffee, [:name] do |task, args|
        set_name(args[:name])
        puts "Create coffee file: #{filename}".magenta
    end
    desc "Create dir for widget"
    task :dir, [:name] do |task, args|
    end
end