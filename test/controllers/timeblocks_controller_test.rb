require "test_helper"

class TimeblocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @timeblock = timeblocks(:one)
  end

  test "should get index" do
    get timeblocks_url
    assert_response :success
  end

  test "should get new" do
    get new_timeblock_url
    assert_response :success
  end

  test "should create timeblock" do
    assert_difference("Timeblock.count") do
      post timeblocks_url, params: { timeblock: { dailyRepeat: @timeblock.dailyRepeat, repeatOnDay: @timeblock.repeatOnDay, taskEndingTime: @timeblock.taskEndingTime, taskStartingTime: @timeblock.taskStartingTime, task_name: @timeblock.task_name } }
    end

    assert_redirected_to timeblock_url(Timeblock.last)
  end

  test "should show timeblock" do
    get timeblock_url(@timeblock)
    assert_response :success
  end

  test "should get edit" do
    get edit_timeblock_url(@timeblock)
    assert_response :success
  end

  test "should update timeblock" do
    patch timeblock_url(@timeblock), params: { timeblock: { dailyRepeat: @timeblock.dailyRepeat, repeatOnDay: @timeblock.repeatOnDay, taskEndingTime: @timeblock.taskEndingTime, taskStartingTime: @timeblock.taskStartingTime, task_name: @timeblock.task_name } }
    assert_redirected_to timeblock_url(@timeblock)
  end

  test "should destroy timeblock" do
    assert_difference("Timeblock.count", -1) do
      delete timeblock_url(@timeblock)
    end

    assert_redirected_to timeblocks_url
  end
end
