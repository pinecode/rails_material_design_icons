# frozen_string_literal: true

require 'rails_material_design_icons/icon_helper'

module MaterialDesignIcons
  module Rails
    # Initialize!
    class Railtie < ::Rails::Railtie
      initializer 'rails_material_design_icons.icon_helper' do
        ActiveSupport.on_load(:action_view) { include MaterialDesignIcons::IconHelper }
      end
    end
  end
end
