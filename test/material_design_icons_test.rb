# frozen_string_literal: true

require 'test_helper'

class MaterialDesignIconsTest < ActionDispatch::IntegrationTest
  teardown { clean_sprockets_cache }

  test 'engine is loaded' do
    assert_equal ::Rails::Engine, MaterialDesignIcons::Rails::Engine.superclass
  end

  test 'fonts are served' do
    get '/assets/materialdesignicons-webfont.eot'
    assert_response :success
    get '/assets/materialdesignicons-webfont.woff2'
    assert_response :success
    get '/assets/materialdesignicons-webfont.woff'
    assert_response :success
    get '/assets/materialdesignicons-webfont.ttf'
    assert_response :success
  end

  test 'stylesheets are served' do
    get '/assets/materialdesignicons.css'
    assert_material_icons(response)
  end

  test 'stylesheets contain asset pipeline references to fonts' do
    get '/assets/materialdesignicons.css'
    assert_match %r{/assets/materialdesignicons-webfont(-\w+)?\.eot}, response.body
    assert_match %r{/assets/materialdesignicons-webfont(-\w+)?\.eot\?#iefix}, response.body
    assert_match %r{/assets/materialdesignicons-webfont(-\w+)?\.woff2}, response.body
    assert_match %r{/assets/materialdesignicons-webfont(-\w+)?\.woff}, response.body
    assert_match %r{/assets/materialdesignicons-webfont(-\w+)?\.ttf},  response.body
  end

  test 'stylesheet is available in a css sprockets require' do
    get '/assets/sprockets-require.css'
    assert_material_icons(response)
  end

  test 'stylesheet is available in a sass import' do
    get '/assets/sass-import.css'
    assert_material_icons(response)
  end

  test 'stylesheet is available in a scss import' do
    get '/assets/scss-import.css'
    assert_material_icons(response)
  end

  test 'helpers should be available in the view' do
    get '/icons'
    assert_response :success
    assert_select 'i.mdi.mdi-sheep'
  end

  private

  def clean_sprockets_cache
    FileUtils.rm_rf File.expand_path('dummy/tmp', __dir__)
  end

  def assert_material_icons(response)
    assert_response :success
    assert_match(/font-family:\s*"Material Design Icons";/, response.body)
  end
end
