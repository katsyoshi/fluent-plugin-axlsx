# -*- encoding: utf-8 -*-
require File.expand_path('../lib/fluent-plugin-axlsx/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["MATSUMOTO Katsuyoshi"]
  gem.email         = ["matsumoto.katsuyoshi+github@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "fluent-plugin-axlsx"
  gem.require_paths = ["lib"]
  gem.version       = Fluent::Plugin::Axlsx::VERSION
end
