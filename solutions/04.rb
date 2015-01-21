module UI
  class TextScreen
    def self.draw(&block)
      TextScreen.new.instance_eval(&block)
    end

    def initialize(separator: "", general_style: nil)
      @separator = separator
      @general_style = general_style
      @result = ""
    end

    def label(text:, border: "", style: nil)
      label = "#{border}#{text}#{border}#{@separator}"
      label = @general_style ? label.send(@general_style) : label
      label = style ? label.send(style) : label
      @result += label
    end
  end
end
