# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rest_resource/version"

Gem::Specification.new do |s|
  s.name        = "rest_resource"
  s.version     = RestResource::VERSION
  s.authors     = ["Yi Wen"]
  s.email       = ["hayafirst@gmail.com"]
  s.homepage    = "https://github.com/ywen/rest_resource"
  s.summary     = %q{A wrapper over rest-client providing basic CRUD restful web service operation}
  s.description = %q{A wrapper over rest-client providing basic CRUD restful web service operation}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_runtime_dependency(%q<rest-client>, [">= 0"])
  s.add_runtime_dependency(%q<activesupport>, [">= 0"])
end
