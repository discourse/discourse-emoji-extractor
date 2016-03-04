require 'set'
require 'fileutils'

DEST_DIR = "/Users/robin/code/discourse/public/images/emoji"

types = [
  {dir: 'twitter', files: [], dest: "twitter"},
  {dir: 'eone', files: [], dest: "emoji_one"},
  {dir: 'android', files: [], dest: "google"},
  {dir: 'apple', files: [], dest: "apple"},
]

all_files = Set.new

types.each do |t|
  Dir["#{t[:dir]}/output/*.png"].each do |f|
    filename = File.basename(f)
    all_files << filename
    t[:files] << filename
  end
end


intersection = all_files.to_a

types.each do |t|
  intersection = intersection & t[:files]
end

intersection.each do |i|
  types.each do |t|
    src = "#{t[:dir]}/output/#{i}"
    dest = "#{DEST_DIR}/#{t[:dest]}/#{i}"

    FileUtils.cp src, dest
  end
end
