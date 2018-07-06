require 'colorize'
Name = {name: nil, small: nil, big: nil}
def get_name
    if ARGV[1]
        Name[:name] ||= ARGV[1]
        Name[:small] ||= ARGV[1].downcase
        Name[:big] ||= ARGV[1].capitalize
    end
    raise "Please add name argument for the rake taks" unless Name[:name]
end
def filename
    "widgets/#{Name[:small]}/#{Name[:small]}"
end
task :widget => %i{scss html coffee} do
    get_name
    puts "This is widget task".red
end

task :scss=>%i{dir} do
    get_name
    puts "I create scss: #{filename}.scss".green
    touch "#{filename}.scss" 
end

task :html=>%i{dir}  do
    get_name
    puts "I create html: #{filename}.html".green
    touch "#{filename}.html"
end

task :coffee=>%i{dir}  do
    get_name
    puts "I create coffee: #{filename}.coffee".green
    touch "#{filename}.coffee"
end

task :dir do
    get_name
    a = "widgets/#{Name[:small]}"
    %x{mkdir #{a}}
    puts "create dir: #{a}".yellow
end

