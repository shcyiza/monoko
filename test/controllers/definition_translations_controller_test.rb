require 'test_helper'

class DefinitionTranslationsControllerTest < ActionController::TestCase
  setup do
    @definition_translation = definition_translations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:definition_translations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create definition_translation" do
    assert_difference('DefinitionTranslation.count') do
      post :create, definition_translation: { definition_id: @definition_translation.definition_id, word_id: @definition_translation.word_id }
    end

    assert_redirected_to definition_translation_path(assigns(:definition_translation))
  end

  test "should show definition_translation" do
    get :show, id: @definition_translation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @definition_translation
    assert_response :success
  end

  test "should update definition_translation" do
    patch :update, id: @definition_translation, definition_translation: { definition_id: @definition_translation.definition_id, word_id: @definition_translation.word_id }
    assert_redirected_to definition_translation_path(assigns(:definition_translation))
  end

  test "should destroy definition_translation" do
    assert_difference('DefinitionTranslation.count', -1) do
      delete :destroy, id: @definition_translation
    end

    assert_redirected_to definition_translations_path
  end
end
