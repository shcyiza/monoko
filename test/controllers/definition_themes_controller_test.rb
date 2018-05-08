require 'test_helper'

class DefinitionThemesControllerTest < ActionController::TestCase
  setup do
    @definition_theme = definition_themes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:definition_themes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create definition_theme" do
    assert_difference('DefinitionTheme.count') do
      post :create, definition_theme: { definition_id: @definition_theme.definition_id, theme_id: @definition_theme.theme_id }
    end

    assert_redirected_to definition_theme_path(assigns(:definition_theme))
  end

  test "should show definition_theme" do
    get :show, id: @definition_theme
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @definition_theme
    assert_response :success
  end

  test "should update definition_theme" do
    patch :update, id: @definition_theme, definition_theme: { definition_id: @definition_theme.definition_id, theme_id: @definition_theme.theme_id }
    assert_redirected_to definition_theme_path(assigns(:definition_theme))
  end

  test "should destroy definition_theme" do
    assert_difference('DefinitionTheme.count', -1) do
      delete :destroy, id: @definition_theme
    end

    assert_redirected_to definition_themes_path
  end
end
