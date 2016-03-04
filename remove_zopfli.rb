require 'fileutils'

# If you run `zopfli -m --prefix *.png` they all get `zopfli_` in front. This removes it:
Dir["zopfli_*.png"].each do |f|
  FileUtils.mv(f, f.sub(/^zopfli_/, ''))
end
