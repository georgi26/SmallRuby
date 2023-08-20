task :racc do
  sh "racc lib/parser/SmallRubyParser.y -o lib/parser/SmallRubyParser.rb"
end

task :spec => :racc do
  sh "ruby specs/all.rb"
end

task :default => :spec
