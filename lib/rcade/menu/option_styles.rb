# encoding: utf-8

module Rcade
  module Menu
    class OptionStyles

      def initialize(parent = nil)
        @parent = parent
      end

      %w(font_family font_size border_width border_color).each do |name|
        define_method name do |value = nil|
          instance_variable_set "@#{name}", value if value
          set_value = instance_variable_get "@#{name}"
          return @parent.send(name) if set_value.nil? and @parent
          set_value
        end
      end

      def opacity(value = nil)
        @opacity = value unless value.nil?
        return @parent.opacity if @opacity.nil? and @parent
        @opacity ||= 1.0
      end

      def color(value = nil)
        if value
          if value.is_a? Symbol
            @color = Color.named(value)
          else
            @color = Color.from_hex(value)
          end
        end
        @color = @parent.color if @color.nil? and @parent
        @color.opacity(opacity)
      end

      def border?
        border_width && border_color
      end

      def height(value)
        @height = value if value
        @height.nil? ? @font_size : @height
      end

      def label(window)
        @label ||= Gosu::Font.new(window, font_family, font_size)
      end

      def selected(&block)
        @selected_styles ||= self.class.new(self)
        @selected_styles.instance_eval(&block) if block_given?
        @selected_styles
      end

    end
  end
end