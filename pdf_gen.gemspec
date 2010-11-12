Gem::Specification.new do |spec|
  spec.name = "pdf_gen"
  spec.version = '0.0.1'
  spec.platform = Gem::Platform::RUBY
  spec.summary = "PDF generator for Ruby"
  spec.files =  Dir["**/*"]
  spec.required_ruby_version = '>= 1.8.7'
  spec.required_rubygems_version = ">= 1.3.6"
  spec.require_path = "."
  spec.add_dependency('pdf-writer', '>= 1.1.8')
  spec.test_files = Dir[ "test/*_test.rb" ]  
  spec.author = "Sphere Inc."
  spec.email = ""  
  spec.description = <<END_DESC
  Sph_pdf_gen is a wrapper on PDF Writer generator for Ruby
END_DESC
end