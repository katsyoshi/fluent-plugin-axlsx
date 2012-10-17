# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["MATSUMOTO Katsuyoshi"]
  gem.email         = ["matsumoto.katsuyoshi+github@gmail.com"]
  gem.description   = %q{hoge}
  gem.summary       = %q{foo}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "fluent-plugin-axlsx"
  gem.require_paths = ["lib"]
  gem.version       = "0.0.1"

  gem.add_dependency "fluentd"
  gem.add_dependency "axlsx"
  gem.add_development_dependency "rake"
end
