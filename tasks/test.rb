# frozen_string_literal: true

task default: :test
task :test do
  Dir.glob('./test/*_test.rb').sort.each { |file| require file }
end
