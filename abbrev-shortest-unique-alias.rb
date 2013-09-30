require 'abbrev'
require 'ap'
require 'pry-debugger'

files = ENV['PATH'].split(':').map {|dir| Dir.glob(dir + '/*')}.flatten
executables = files.select {|file| File.executable? file }.map {|file| file.split('/').last }
matches = Abbrev.abbrev executables

intended_alias = ARGV[0]
potential_aliases = matches.select {|key, value| intended_alias == value }.keys.min_by(&:length)
alias_command = "alias #{intended_alias}=#{shortest_alias}"
File.open(ENV['HOME'] + '/.bashrc', 'a') { |f| f.write(alias_command) }
puts alias_command
