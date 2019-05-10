require 'bundler'
Bundler.require
$:.unshift File.expand_path("./../lib", __FILE__)
require 'app/application'

#launching Application.new will start a new game
Application.new
