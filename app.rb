require 'bundler'
Bundler.require
require_relative 'lib/scrapper'

$:.unshift File.expand_path("./../lib", __FILE__)
#require 'app/scrapper'
#require 'app/email_sender' pas necessaire ici

Scrapper.new.perform


=begin
require 'bundler'
require_relative 'lib/test'

Bundler.require
$:.unshift File.expand_path("./../lib", __FILE__)

db = Scrapper.new('https://www.annuaire-des-mairies.com/val-d-oise.html')
db.save_as_JSON
=end