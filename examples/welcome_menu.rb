# encoding: utf-8

require_relative '../lib/rcade_menu'

class WelcomeMenu < Rcade::Menu::Screen

  menu_position bottom: 100, x: :center
  menu_alignment :horizontal

  option_styles do
    font_family 'Helvetica'
    font_size 40
    # color '#fff'
    color :white
    opacity 0.5
    border_width 1
    border_color :white
    selected do
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