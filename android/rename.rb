# encoding: utf-8
require "fileutils"
require 'json'

json = JSON.parse(File.read('../emoji.json'))

json.each do |name, v|
  code = "uni#{v['unicode']}".sub(/\-/, '_uni')

  if File.exist?("ExtractedEmojis/#{code}.png")
    FileUtils.cp("ExtractedEmojis/#{code}.png", "output/#{name}.png")
  end
end
