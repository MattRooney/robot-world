require 'rake/testrobot'
require 'bundler'
Bundler.require

robot :test do
  Dir.glob('./test/**/*_test.rb') { |file| require file }
  end
