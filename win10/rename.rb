# encoding: utf-8
require "fileutils"
require 'json'

json = JSON.parse(File.read('../emoji.json'))

json.each do |name, v|
  code = v['unicode'].upcase

  if File.exist?("72x72/windows_#{code}.png")
    FileUtils.cp("72x72/windows_#{code}.png", "output/#{name}.png")
  end
end
