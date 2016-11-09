Gem::Specification.new do |s|
  s.name = 'logstash-filter-memorize'
  s.version         = '1.0.0'
  s.licenses = ['Apache License (2.0)']
  s.summary = "The memorize filter is able to pick out details of an event and use that information in future events if it is not present."
  s.description = "This gem is a logstash plugin required to be installed on top of the Logstash core pipeline using $LS_HOME/bin/plugin install gemname. This gem is not a stand-alone program"
  s.authors = ["Adam Caldwell"]
  s.email = 'alcanzar@gmail.com'
  s.homepage = "http://www.elastic.co/guide/en/logstash/current/index.html"
  s.require_paths = ["lib"]

  # Files
  s.files = `git ls-files`.split($\)
   # Tests
  s.test_files = s.files.grep(%r{^(test|spec|features)/})

  # Special flag to let us know this is actually a logstash plugin
  s.metadata = { "logstash_plugin" => "true", "logstash_group" => "filter" }

  # Gem dependencies
  s.add_runtime_dependency "logstash-core", '>= 1.6.0', '< 6.0.0'
  s.add_development_dependency 'logstash-devutils'
end
