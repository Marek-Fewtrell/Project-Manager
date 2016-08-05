require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  setup do
    @project = projects(:projectone)

    #Need to sign in.
    @adminUser = users(:bob)
    session[:user_id] = @adminUser.id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post :create, project: { title: 'Test Project', description: 'Test Project description', dev_env: 'Test Dev Env', prod_env: 'Test Prod Env', language_desc: 'Test Language Desc'}
    end

    assert_redirected_to projects_path()
  end

  test "should show project" do
    get :show, id: @project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project
    assert_response :success
  end

  test "should update project" do
    patch :update, id: @project, project: { title: 'Test Project Updated' }
    assert_redirected_to project_path(assigns(:project))
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete :destroy, id: @project
    end

    assert_redirected_to projects_path
  end
end
