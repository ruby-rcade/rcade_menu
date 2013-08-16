# encoding: utf-8

require_relative '../lib/rcade_menu'

class WelcomeMenu < Rcade::Menu::Screen

  menu_position bottom: 50, x: :center # 50px from the bottom, centered on x axis

  menu_alignment :vertical  # stack options vertically, or use :horizontal

  option_styles do
    font_family 'Helvetica'
    font_size 40
    color '#fff' # or :white
    opacity 0.5
    border_width 1
    border_color :white
    selected do # override defaults
      opacity 1.0
    end
  end

  option 'Start' do
    puts 'Start was selected'
  end

  option 'Options' do
    puts 'Options was selected'
  end

end

WelcomeMenu.new(800, 600, false).show