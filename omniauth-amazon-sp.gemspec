Gem::Specification.new do |spec|
  spec.name = "omniauth-amazon-sp"
  spec.version = "1.0.0"
  spec.authors = ["Ethan Denvir"]
  spec.email = ["edenvir99@gmail.com"]
  spec.summary = "Omniauth strategy for Amazon Selling Partner"
  spec.description = "Omniauth strategy for Amazon Selling Partner"
  spec.files = ["lib/omniauth-amazon-sp.rb"]

  spec.license = "MIT"

  spec.add_dependency "omniauth"
  spec.add_dependency "omniauth-oauth2"

  spec.add_development_dependency "bundler", "~> 2.0"
end
