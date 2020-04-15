require 'test_helper'

class SurveysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get surveys_index_url
    assert_response :success
  end

  test "should get start" do
    get surveys_start_url
    assert_response :success
  end

  test "should get question" do
    get surveys_question_url
    assert_response :success
  end

  test "should get answer" do
    get surveys_answer_url
    assert_response :success
  end

  test "should get end" do
    get surveys_end_url
    assert_response :success
  end

end
