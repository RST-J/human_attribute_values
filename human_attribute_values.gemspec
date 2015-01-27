$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "human_attribute_values/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "human_attribute_values"
  s.version     = HumanAttributeValues::VERSION
  s.authors     = ["Jonas Peschla"]
  s.email       = ["github@peschla.net"]
  s.homepage    = "TODO"
  s.summary     = "Translate attribute values for enums analogoues to human_attribute_name"
  s.description = "TODO: Description of HumanAttributeValue."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.8"

  s.add_development_dependency "sqlite3"
end
