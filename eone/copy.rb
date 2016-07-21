require 'fileutils'

DEST = File.expand_path("~/code/discourse/public/images/emoji/emoji_one/")

Dir["output/zopfli_*"].each do |f|
  dest_file = "#{DEST}/#{f.sub(/^output\/zopfli_/, '')}"

  if File.exist?(dest_file)
    FileUtils.cp f, dest_file
  end
end
