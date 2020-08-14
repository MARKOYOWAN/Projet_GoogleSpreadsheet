require 'bundler'
Bundler.require
require_relative 'lib/scrapper'

$:.unshift File.expand_path("./../lib", __FILE__)
Scrapper.new.final
