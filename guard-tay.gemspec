# -*- encoding: utf-8 -*-
require File.expand_path('../lib/guard/tay/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Thomas Rix"]
  gem.email         = ["tom@rixth.org"]
  gem.description   = %q{Guard::Tay automatically recompiles your tay-based extensions on change}
  gem.summary       = %q{Guard gem for tay}
  gem.homepage      = "http://github.com/rixth/guard-tay"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "guard-tay"
  gem.require_paths = ["lib"]
  gem.version       = Guard::TayVersion::VERSION

  gem.add_dependency 'tay', '>= 0.0.4'
  gem.add_dependency 'guard', '>= 1.0.3'

  gem.add_development_dependency 'rake'
end
