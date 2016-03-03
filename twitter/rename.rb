# encoding: utf-8
require "fileutils"
require 'json'

json = JSON.parse(File.read('../emoji.json'))

json.each do |name, v|
  code = v['unicode']

  if File.exist?("72x72/#{code}.png")
    FileUtils.cp("72x72/#{code}.png", "output/#{name}.png")
  end
end
