Gem::Specification.new do |spec|
  spec.name = "pdf_gen"
  spec.version = '0.7'
  spec.platform = Gem::Platform::RUBY
  spec.summary = "PDF generator for Ruby"
  spec.files =  Dir["**/*"].reject!{ |fn| true if fn =~ /^test.rb|.*\.pdf|.git/}
  spec.required_ruby_version = '>= 1.8.7'
  spec.required_rubygems_version = ">= 1.3.6"
  spec.require_paths = ["lib"]
  spec.add_dependency('pdf-writer', '>= 1.1.8')
  spec.test_files = Dir[ "test/*_test.rb" ]
  spec.rubyforge_project = %q{pdf_gen}
  spec.author = "Sphere Consulting Inc."
  spec.homepage = 'https://github.com/SphereConsultingInc/pdf_gen/'
  spec.description = <<END_DESC
  Sph_pdf_gen is a wrapper on PDF Writer generator for Ruby
END_DESC
end