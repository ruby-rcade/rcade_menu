# encoding: utf-8

module Rcade
  module Menu
    class Option

      attr_accessor :text, :callback
      attr_accessor :window, :styles

      def initialize(text, &callback)
        @text = text
        @callback = callback
      end

      def width
        styles.label(window).text_width(@text)
      end

      def height
        styles.label(window).height
      end

      def render(x, y, z, selected)
        if selected
          styles.selected.label(window).draw(@text, x, y, z, 1.0, 1.0, styles.selected.color)
        else
          styles.label(window).draw(@text, x, y, z, 1.0, 1.0, styles.color)
        end
      end

    end
  end
end