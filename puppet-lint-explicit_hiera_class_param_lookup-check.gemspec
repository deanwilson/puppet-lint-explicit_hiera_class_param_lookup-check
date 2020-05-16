Gem::Specification.new do |spec|
  spec.name        = 'puppet-lint-explicit_hiera_class_param_lookup-check'
  spec.version     = '0.1.2'
  spec.homepage    = 'https://github.com/deanwilson/puppet-lint-explicit_hiera_class_param_lookup-check'
  spec.license     = 'MIT'
  spec.author      = 'Dean Wilson'
  spec.email       = 'dean.wilson@gmail.com'
  spec.files       = Dir[
    'README.md',
    'LICENSE',
    'lib/**/*',
    'spec/**/*',
  ]
  spec.test_files  = Dir['spec/**/*']
  spec.summary     = 'puppet-lint explicit_hiera_class_param_lookup check'
  spec.description = <<-EOF
    Extends puppet-lint to ensure there are no explicit calls to hiera()
    in the class parameters.
  EOF

  spec.add_dependency             'puppet-lint', '>= 1.1', '< 3.0'
  spec.add_development_dependency 'rspec', '~> 3.9.0'
  spec.add_development_dependency 'rspec-its', '~> 1.0'
  spec.add_development_dependency 'rspec-collection_matchers', '~> 1.0'
  spec.add_development_dependency 'rubocop', '~> 0.83.0'
  spec.add_development_dependency 'rake', '~> 13.0.0'
  spec.add_development_dependency 'rspec-json_expectations', '~> 2.2'
  spec.add_development_dependency 'simplecov', '~> 0.18.0'
end
