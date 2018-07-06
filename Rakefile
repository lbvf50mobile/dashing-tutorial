require 'colorize'
Name = {name: nil, downcase: nil, capitalize: nil}
def get_name
    if ARGV[1]
        Name[:name] ||= ARGV[1]
        Name[:downcase] ||= ARGV[1]
        Name[:capitalize] ||= ARGV[1]
    end
end
task :widget => %i{scss html coffee} do
    get_name
    p ARGV[1]
end

task :scss do
    get_name
    puts "I create sccs".green 
end

task :html do
    get_name
    puts "I create html".green
end

task :coffee do
    get_name
    puts "I create coffee".green
end

