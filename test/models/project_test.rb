require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "has rows" do
    projects = Project.all
    assert_equal 2, projects.count, "Incorrect number of rows"
  end

  test "create new project" do
    flunk "Test incomplete"
    newProject = Project.new(project_params)
  end

  test "update project" do
    flunk "Test incomplete"
    updateProject = Projest.find(0)
    updateProject.update_attributes(project_params)
  end

  test "delete project" do
    flunk "Test incomplete"
    deleteProject = Project.find(0)
    deleteProject.destroy
  end
end
