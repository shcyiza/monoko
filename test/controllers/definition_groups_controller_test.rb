require 'test_helper'

class DefinitionGroupsControllerTest < ActionController::TestCase
  setup do
    @definition_group = definition_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:definition_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create definition_group" do
    assert_difference('DefinitionGroup.count') do
      post :create, definition_group: { definition_id: @definition_group.definition_id, group_id: @definition_group.group_id }
    end

    assert_redirected_to definition_group_path(assigns(:definition_group))
  end

  test "should show definition_group" do
    get :show, id: @definition_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @definition_group
    assert_response :success
  end

  test "should update definition_group" do
    patch :update, id: @definition_group, definition_group: { definition_id: @definition_group.definition_id, group_id: @definition_group.group_id }
    assert_redirected_to definition_group_path(assigns(:definition_group))
  end

  test "should destroy definition_group" do
    assert_difference('DefinitionGroup.count', -1) do
      delete :destroy, id: @definition_group
    end

    assert_redirected_to definition_groups_path
  end
end
