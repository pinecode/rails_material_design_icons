# frozen_string_literal: true

require 'test_helper'

module MaterialDesignIcons
  module Rails
    class IconHelperTest < ActionView::TestCase
      test '#md_icon with no args should render a sheep icon' do
        assert_icon i('mdi mdi-sheep')
      end

      # test "#fa_icon should render different individual icons" do
      #   assert_icon i("fa fa-flag"),         "flag"
      #   assert_icon i("fa fa-camera-retro"), "camera-retro"
      #   assert_icon i("fa fa-cog"),          "cog"
      #   assert_icon i("fa fa-github"),       "github"
      # end

      # test "#fa_icon should render icons with multiple modifiers" do
      #   assert_icon i("fa fa-pencil fa-fixed-width"), "pencil fixed-width"
      #   assert_icon i("fa fa-flag fa-4x"),            "flag 4x"
      #   assert_icon i("fa fa-refresh fa-2x fa-spin"), "refresh 2x spin"
      # end

      # test "#fa_icon should render icons with array modifiers" do
      #   assert_icon i("fa fa-flag"),                  ["flag"]
      #   assert_icon i("fa fa-check fa-li"),           ["check", "li"]
      #   assert_icon i("fa fa-flag fa-4x"),            ["flag", "4x"]
      #   assert_icon i("fa fa-refresh fa-2x fa-spin"), ["refresh", "2x", "spin"]
      # end

      # test "#fa_icon should incorporate additional class styles" do
      #   assert_icon i("fa fa-flag pull-right"),                "flag",         :class => "pull-right"
      #   assert_icon i("fa fa-flag fa-2x pull-right"),          ["flag", "2x"], :class => ["pull-right"]
      #   assert_icon i("fa fa-check fa-li pull-right special"), "check li",     :class => "pull-right special"
      #   assert_icon i("fa fa-check pull-right special"),       "check",        :class => ["pull-right", "special"]
      # end

      # test "#fa_icon should incorporate a text suffix" do
      #   assert_icon "#{i("fa fa-camera-retro")} Take a photo", "camera-retro", :text => "Take a photo"
      # end

      # test "#fa_icon should be able to put the icon on the right" do
      #   assert_icon "Submit #{i("fa fa-chevron-right")}", "chevron-right", :text => "Submit", :right => true
      # end

      # test "#fa_icon should html escape text" do
      #   assert_icon "#{i("fa fa-camera-retro")} &lt;script&gt;&lt;/script&gt;", "camera-retro", :text => "<script></script>"
      # end

      # test "#fa_icon should not html escape safe text" do
      #   assert_icon "#{i("fa fa-camera-retro")} <script></script>", "camera-retro", :text => "<script></script>".html_safe
      # end

      # test "#fa_icon should pull it all together" do
      #   assert_icon "#{i("fa fa-camera-retro pull-right")} Take a photo", "camera-retro", :text => "Take a photo", :class => "pull-right"
      # end

      # test "#fa_icon should pass all other options through" do
      #   assert_icon %(<i class="fa fa-user" data-id="123"></i>), "user", :data => { :id => 123 }
      # end

      # test '#fa_icon does not modify options' do
      #   icon_options = { :class => 'foo', :data => { :id => 123 }, :text => 'bar' }
      #   assert_icon %(<i class="fa fa-user foo" data-id="123"></i> bar), "user", icon_options
      #   assert_includes icon_options, :class
      #   assert_includes icon_options, :text
      #   assert_includes icon_options, :data
      # end

      private

      def assert_icon(expected, *args)
        message = "`md_icon(#{args.inspect[1...-1]})` should return `#{expected}`"
        assert_dom_equal expected, md_icon(*args), message
      end

      def i(classes)
        %(<i class="#{classes}"></i>)
      end
    end
  end
end
