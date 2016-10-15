require 'test_helper'

class ExemplesControllerTest < ActionController::TestCase
  setup do
    @exemple = exemples(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exemples)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exemple" do
    assert_difference('Exemple.count') do
      post :create, exemple: { content: @exemple.content, contributor_id: @exemple.contributor_id, definition_id: @exemple.definition_id, is_fr: @exemple.is_fr, is_li: @exemple.is_li, is_validated: @exemple.is_validated, source: @exemple.source }
    end

    assert_redirected_to exemple_path(assigns(:exemple))
  end

  test "should show exemple" do
    get :show, id: @exemple
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exemple
    assert_response :success
  end

  test "should update exemple" do
    patch :update, id: @exemple, exemple: { content: @exemple.content, contributor_id: @exemple.contributor_id, definition_id: @exemple.definition_id, is_fr: @exemple.is_fr, is_li: @exemple.is_li, is_validated: @exemple.is_validated, source: @exemple.source }
    assert_redirected_to exemple_path(assigns(:exemple))
  end

  test "should destroy exemple" do
    assert_difference('Exemple.count', -1) do
      delete :destroy, id: @exemple
    end

    assert_redirected_to exemples_path
  end
end
