task :bootstrap do
  cp('.ruby-gemset.sample', '.ruby-gemset')
  cp('.ruby-version.sample', '.ruby-version')
  cp('.env.sample', '.env')
  system('bundle install')
end

task :clean do
  Dir.glob('./log/*.log').each { |f| rm(f) }
  Dir.glob('./output/*.{csv,json}').each { |f| rm(f) }
end
