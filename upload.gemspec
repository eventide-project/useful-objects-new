# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = "evt-upload"
  s.summary = ""
  s.version = "2.0.0.0"
  s.description = "Reference implementation of a useful object"

  s.authors = ["The Eventide Project"]
  s.email = "opensource@eventide-project.org"
  s.homepage = "https://github.com/eventide-project/useful-objects-new"
  s.licenses = ["MIT"]

  s.require_paths = ["lib"]
  s.files = Dir.glob("{lib}/**/*")
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = ">= 4"

  s.add_runtime_dependency "evt-dependency"
  s.add_runtime_dependency "evt-initializer"

  s.add_development_dependency "test_bench"
end
