require 'test_helper'

class SummariesControllerTest < ActionController::TestCase
  setup do
    @summary = summaries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:summaries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create summary" do
    assert_difference('Summary.count') do
      post :create, :summary => @summary.attributes
    end

    assert_redirected_to summary_path(assigns(:summary))
  end

  test "should show summary" do
    get :show, :id => @summary.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @summary.to_param
    assert_response :success
  end

  test "should update summary" do
    put :update, :id => @summary.to_param, :summary => @summary.attributes
    assert_redirected_to summary_path(assigns(:summary))
  end

  test "should destroy summary" do
    assert_difference('Summary.count', -1) do
      delete :destroy, :id => @summary.to_param
    end

    assert_redirected_to summaries_path
  end
end
