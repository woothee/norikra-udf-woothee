# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'norikra/udf/woothee/version'

Gem::Specification.new do |spec|
  spec.name          = "norikra-udf-woothee"
  spec.version       = Norikra::UDF::Woothee::VERSION
  spec.authors       = ["TAGOMORI Satoshi"]
  spec.email         = ["tagomoris@gmail.com"]
  spec.description   = %q{Woothee UDF for Norikra}
  spec.summary       = %q{Norikra UDF to parse User-Agent}
  spec.homepage      = "https://github.com/tagomoris/norikra-plugin-woothee"
  spec.license       = "GPLv2"
  spec.platform      = "java" #Gem::Platform::JAVA

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib", "jar"]

#  spec.add_runtime_dependency "norikra"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
