require 'pathname'


files = Dir["output/*.png"].map {|p| Pathname.new(p).basename.to_s }
discourse_files = Dir["/Users/robin/code/discourse/public/images/emoji/apple/*"].map {|p| Pathname.new(p).basename.to_s } 

puts (discourse_files - files).inspect
