require "rake"
require "rake/testtask"
require "rake/gempackagetask"
require "rake/clean"

task :default => :test

CLEAN << "pkg" << "doc" << "coverage" << ".yardoc"
Rake::GemPackageTask.new(eval(File.read("code_in_docs.gemspec"))) { |pkg| }
Rake::TestTask.new(:test) { |t| t.pattern = "test/**/*_test.rb" }

begin
  require "yard"
  YARD::Rake::YardocTask.new do |t|
    t.options = ["--output-dir=doc"]
  end
rescue LoadError
end