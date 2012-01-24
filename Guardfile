# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard :bundler do
  watch('Gemfile')
  watch(/^.+\.gemspec/)
end

guard 'rspec', :cli => '--color --tag ~integration --tag ~pending', :version => 2 do
  # Rails example
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/fraudpointer/(.+)\.rb$})              { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^fixtures/(.+)})                           { "spec" }
  watch('lib/fraudpointer-client.rb')                 { "spec" }
  watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
  watch('spec/spec_helper.rb')                        { "spec" }
end
