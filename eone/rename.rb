# encoding: utf-8
require "fileutils"
require 'json'

json = JSON.parse(File.read('../emoji.json'))

json.each do |name, v|
  code = v['unicode']

  if File.exist?("64x64/#{code}.png")
    FileUtils.cp("64x64/#{code}.png", "output/#{name}.png")
  end
end
