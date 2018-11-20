require File.expand_path("../lib/code_in_docs/version", __FILE__)

spec = Gem::Specification.new do |s|
  s.name              = "code_in_docs"
  s.rubyforge_project = "[none]"
  s.version           = CodeInDocs::Version::STRING
  s.authors           = "Peter Grainger"
  s.email             = "peter.grainger@sage.com"
  s.homepage          = "http://github.com/your_github_user_name/code_in_docs"
  s.summary           = ""
  s.description       = ""
  s.platform         = Gem::Platform::RUBY
  s.has_rdoc         = true
  s.test_files       = Dir.glob "test/**/*_test.rb"
  s.files            = `git ls-files`.split("\n").reject {|f| f =~ /^\./}
  s.executables       = ["code_in_docs"]
end
