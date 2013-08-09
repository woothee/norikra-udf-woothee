require "bundler/gem_tasks"

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = ["-c", "-f progress"] # '--format specdoc'
  t.pattern = 'spec/**/*_spec.rb'
end

task :compile do
  jarname = "norikra-udf-woothee.jar"
  SRC = FileList['java/**/*.java']
  CLASSPATH = FileList['jar/**/*.jar'].select{|f| not f.end_with?('/' + jarname)}.join(':')
  SRC.each do |fn|
    sh "env LC_ALL=C javac -classpath #{CLASSPATH} #{fn}"
  end
  sh "env LC_ALL=C jar -cf jar/#{jarname} -C java ."
end

task :test => [:compile, :spec]
task :default => :test

task :all => [:compile, :spec, :build]
