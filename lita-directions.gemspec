Gem::Specification.new do |spec|
  spec.name          = "lita-directions"
  spec.version       = "0.0.7"
  spec.authors       = ["Dan Cash"]
  spec.email         = ["dancash04@gmail.com"]
  spec.description   = %q{A Lita handler to get time/distance calculations and provide directions from google maps}
  spec.summary       = %q{See Description}
  spec.homepage      = "https://github.com/cashman04/lita-directions/"
  spec.license       = "MIT"
  spec.metadata      = { "lita_plugin_type" => "handler" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "lita", ">= 4.1"
  spec.add_runtime_dependency "rest-client", ">= 1.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rspec", ">= 3.0.0"
end
