require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  setup do
    @project = projects(:projectone)
    @task = tasks(:taskone)

    #Need to sign in.
    @adminUser = users(:bob)
    session[:user_id] = @adminUser.id
  end

  #test "should get index" do
    #get :index
    #assert_response :success
    #assert_not_nil assigns(:tasks)
  #end

  test "should get new" do
    get :new, project_id: @project.id
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post :create, project_id: @project.id, task: { title: 'Test Task', description: 'Test Task Description', status: 'test task status' }
    end

    assert_redirected_to project_path(@project.id)
  end

  test "should show task" do
    get :show, id: @task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @task, project_id: @project.id
    assert_response :success
  end

  test "should update task" do
    patch :update, id: @task, project_id: @project.id, task: { title: 'Test Task Updated' }
    assert_redirected_to project_path(@project.id)
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete :destroy, id: @task, project_id: @project.id
    end

    assert_redirected_to project_path(@project.id)
  end
end
