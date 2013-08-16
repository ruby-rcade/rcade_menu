# encoding: utf-8

module Rcade
  module Menu
    class Menu

      attr_accessor :options, :option_styles
      attr_accessor :width, :height
      attr_accessor :alignment

      def initialize
        @options = []
        @option_styles = OptionStyles.new
        @selected_option = 0
      end

      def add_option(label_text, &callback)
        @options << Option.new(label_text, &callback)
      end

      def decrement_selection
        @selected_option -= 1 unless @selected_option == 0
      end

      def increment_selection
        @selected_option += 1 unless @selected_option == @options.count - 1
      end

      def select_current_option
        @options[@selected_option].callback.call
      end

      def position(x: nil, y: nil, top: nil, right: nil, bottom: nil, left: nil)
        if x.nil?
          x = left if left
          x = -(right) if right
          x = 0 unless x
        end
        @x = x

        if y.nil?
          y = top if top
          y = -(bottom) if bottom
          y = 0 unless y
        end
        @y = y
      end

      # assumes all options are the same width
      def width
        if alignment == :vertical
          @width ||= @options.first.width
        else
          @width ||= @options.count * @options.first.width
        end
      end

      # assumes all options are the same height
      def height
        if alignment == :vertical
          @height ||= @options.count * @options.first.height
        else
          @height ||= @options.first.height
        end
      end

      def offset_left(window)
        @offset_left ||= case @x
          when :left   then 0
          when :center then window.width / 2 - width
          when :right  then window.width - width
          else @x < 0 ? @x + window.width - width : @x
        end
      end

      def offset_top(window)
        @offset_top ||= case @y
          when :top    then 0
          when :center then window.height / 2 - height
          when :bottom then window.height - height
          else @y < 0 ? @y + window.height - height : @y
        end
        @offset_top
      end

      def render(window)
        options.each_with_index do |option, i|
          option.window = window
          option.styles = @option_styles
          x = offset_left(window)
          y = offset_top(window)

          x += i * option.width if alignment == :horizontal
          y += i * option.height if alignment == :vertical
          z = 0 # TODO
          selected = @selected_option == i

          option.render(x, y, z, selected)
        end
      end

    end
  end
end