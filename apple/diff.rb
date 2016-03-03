require 'pathname'


discourse_files = Dir["/Users/robin/code/discourse/public/images/emoji/apple/*"].map {|p| Pathname.new(p).basename.to_s } 

Dir["output/*.png"].each do |p|
  bn = Pathname.new(p).basename.to_s

  if discourse_files.include?(bn)
    File.delete(p)
  end
end
