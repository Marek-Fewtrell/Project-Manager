require 'test_helper'

class FeaturesControllerTest < ActionController::TestCase
  setup do
    @feature = features(:one)
    @project = projects(:projectone)

    #Need to sign in.
    @adminUser = users(:bob)
    session[:user_id] = @adminUser.id
  end

  #test "should get index" do
  #  get :index
  #  assert_response :success
  #  assert_not_nil assigns(:features)
  #end

  test "should get new" do
    get :new, project_id: @project.id
    assert_response :success
  end

  test "should create feature" do
    assert_difference('Feature.count') do
      post :create, feature: { title: 'Test Feature', description: 'Test Feature Description', status: 'Test Feature Status' }, project_id: @project.id
    end
    assert_redirected_to project_path(@project.id)
  end

  test "should show feature" do
    get :show, id: @feature
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @feature, project_id: @project.id
    assert_response :success
  end

  test "should update feature" do
    patch :update, id: @feature, feature: { title: 'Test Feature Updated' }, project_id: @project.id
    assert_redirected_to project_path(@project.id)
  end

  test "should destroy feature" do
    assert_difference('Feature.count', -1) do
      delete :destroy, id: @feature, project_id: @project.id
    end

    assert_redirected_to project_path(@project.id)
  end
end
