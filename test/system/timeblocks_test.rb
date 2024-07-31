require "application_system_test_case"

class TimeblocksTest < ApplicationSystemTestCase
  setup do
    @timeblock = timeblocks(:one)
  end

  test "visiting the index" do
    visit timeblocks_url
    assert_selector "h1", text: "Timeblocks"
  end

  test "should create timeblock" do
    visit timeblocks_url
    click_on "New timeblock"

    check "Dailyrepeat" if @timeblock.dailyRepeat
    fill_in "Repeatonday", with: @timeblock.repeatOnDay
    fill_in "Taskendingtime", with: @timeblock.taskEndingTime
    fill_in "Taskstartingtime", with: @timeblock.taskStartingTime
    fill_in "Task name", with: @timeblock.task_name
    click_on "Create Timeblock"

    assert_text "Timeblock was successfully created"
    click_on "Back"
  end

  test "should update Timeblock" do
    visit timeblock_url(@timeblock)
    click_on "Edit this timeblock", match: :first

    check "Dailyrepeat" if @timeblock.dailyRepeat
    fill_in "Repeatonday", with: @timeblock.repeatOnDay
    fill_in "Taskendingtime", with: @timeblock.taskEndingTime
    fill_in "Taskstartingtime", with: @timeblock.taskStartingTime
    fill_in "Task name", with: @timeblock.task_name
    click_on "Update Timeblock"

    assert_text "Timeblock was successfully updated"
    click_on "Back"
  end

  test "should destroy Timeblock" do
    visit timeblock_url(@timeblock)
    click_on "Destroy this timeblock", match: :first

    assert_text "Timeblock was successfully destroyed"
  end
end
