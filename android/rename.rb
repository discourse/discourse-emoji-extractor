# encoding: utf-8
require "fileutils"
require 'json'

json = JSON.parse(File.read('../emoji.json'))

json.each do |name, v|
  code = "emoji_u#{v['unicode'].gsub(/\-/, '_')}"

  if File.exist?("128x128/#{code}.png")
    FileUtils.cp("128x128/#{code}.png", "output/#{name}.png")
  end
end
