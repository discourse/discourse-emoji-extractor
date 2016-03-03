require 'ttfunk'
require 'json'

module Emoji
  class Extractor
    EMOJI_TTF = "emoji.ttf"

    attr_reader :ttf, :size, :images_path

    def initialize(size, images_dir)
      @size = size
      @images_path = Pathname.new(images_dir)
      @ttf = TTFunk::File.open(Pathname.new(EMOJI_TTF))
    end

    def extract!
      ttf.maximum_profile.num_glyphs.times do |glyph_id|
        bitmap = extract_bitmap(glyph_id)
        next if bitmap.nil?

        ttf_name = ttf.postscript.glyph_for(glyph_id)
        code = ttf_name.gsub(/u/, '').gsub('_', '-').gsub(/\.0$/, '').downcase
        name = emoji_char_codes[code]

        if name
          filename = "#{name}.#{bitmap.type}"
          File.write(images_path.join(filename), bitmap.data.read)
        end
      end
    end

    private
      def extract_bitmap(glyph_id)
        bitmaps = ttf.sbix.all_bitmap_data_for(glyph_id)
        bitmaps.detect { |b| b.ppem == size }
      end


      def emoji_char_codes
        return @emoji_char_codes if @emoji_char_codes

        json = JSON.parse(File.read('../emoji.json'))

        @emoji_char_codes = {}
        json.each do |k, v|
          @emoji_char_codes[v['unicode']] = k
        end
      end
  end
end

extractor = Emoji::Extractor.new(64, 'output')
extractor.extract!
