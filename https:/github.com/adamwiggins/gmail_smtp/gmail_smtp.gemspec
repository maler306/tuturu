$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "gmail_smtp/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "gmail_smtp"
  s.version     = GmailSmtp::VERSION
  s.authors     = ["Yerkin"]
  s.email       = ["maler306@gmail.com"]
  s.homepage    = "https://stormy-shore-12316.herokuapp.com"
  s.summary     = "Rails & Postgres CMS Engine"
  s.description = "Rails & Postgres CMS Engine (find ticket service)."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.2"

  s.add_development_dependency "pg"
end
