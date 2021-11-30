# frozen_string_literal: true

require 'test_helper'

module MaterialDesignIcons
  class IconHelperTest < ActionView::TestCase
    test '#md_icon with no args should render a sheep icon' do
      assert_icon i('mdi mdi-sheep')
    end

    test '#md_icon should render different individual icons' do
      assert_icon i('mdi mdi-flag'),         'flag'
      assert_icon i('mdi mdi-camera-retro'), 'camera-retro'
      assert_icon i('mdi mdi-cog'),          'cog'
      assert_icon i('mdi mdi-github'),       'github'
    end

    test '#md_icon_spin adds the spin class' do
      assert_dom_equal mdi_icon_spin('sheep'), i_spin('mdi mdi-sheep')
      assert_dom_equal mdi_spin('sheep'), i_spin('mdi mdi-sheep')
    end

    private

    def assert_icon(expected, *args)
      message = "`mdi_icon(#{args.inspect[1...-1]})` should return `#{expected}`"
      assert_dom_equal expected, mdi_icon(*args)
    end

    def i(classes)
      %(<i class="#{classes}"></i>)
    end

    def i_spin(classes)
      i(classes + ' mdi-spin')
    end
  end
end
