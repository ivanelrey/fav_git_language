lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fav_language/version'

Gem::Specification.new do |spec|
  spec.name          = 'fav_language'
  spec.version       = FavLanguage::VERSION
  spec.authors       = ['ivane gkomarteli']
  spec.email         = ['ivanejg@yahoo.com']

  spec.summary       = 'Gem that finds the favorite programming language of a github user.'
  spec.homepage      = 'https://github.com/ivanelrey'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_dependency 'graphql-client', '~> 0.14.0'
end
