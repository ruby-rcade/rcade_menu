# encoding: utf-8

module Rcade
  module Menu
    class Screen < Gosu::Window

      def self.inherited(subclass)
        subclass.extend DSL
      end

      module DSL
        def menu
          @menu ||= Menu.new
        end

        def option_styles(&block)
          menu.option_styles.instance_eval(&block) if block_given?
        end

        def menu_position(args)
          menu.position(args)
        end

        def menu_alignment(alignment)
          menu.alignment = alignment
        end

        def option(label_text, &callback)
          menu.add_option(label_text, &callback)
        end
      end

      def menu
        self.class.menu
      end

      def button_down(button)
        case button
        when Quit  then close
        when Enter then menu.select_current_option
        when P1Up    then menu.decrement_selection if menu.alignment == :vertical
        when P1Down  then menu.increment_selection if menu.alignment == :vertical
        when P1Left  then menu.decrement_selection if menu.alignment == :horizontal
        when P1Right then menu.increment_selection if menu.alignment == :horizontal
        end
      end

      def draw
        menu.render(self)
      end

    end
  end
end