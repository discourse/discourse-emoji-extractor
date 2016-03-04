require 'json'
DEST_DIR = "/Users/robin/code/discourse/public/images/emoji"

json = JSON.parse(File.read("emoji.json"))

emojis = []
aliases = {}

Dir["#{DEST_DIR}/twitter/*.png"].each do |f|
  file = File.basename(f)

  name = file.sub(/\.png$/, '')

  found = json[name]
  if found
    emojis << { code: found['unicode'], name: name }
    unless found['aliases'].empty?
      aliases[name] = found['aliases'].map {|a| a.gsub(/:/, '') }
    end
  end
end

result = { emojis: emojis, aliases: aliases }
puts JSON.pretty_generate(result)
