require 'plist'
module RubyiCloud
  class PlistResponse < Response
    def parse
      @content = Plist::parse_xml(content)
      @plist_base = nil
    end

    def [](key)
      unless @plist_base.nil?
        @content[base][key]
      else
        @content[key]
      end
    end
  end
end
