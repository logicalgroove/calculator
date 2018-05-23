require "application_system_test_case"

class CalculatorsTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit calculators_url
    assert_selector "h1", text: "Calculator"
  end

  test "perform regular calculation" do
    visit calculators_url
    fill_in "calculator_a", with: "10"
    fill_in "calculator_b", with: "20"
    select "+", from: "calculator_operation"

    click_on "Calculate!"

    assert_text "10 + 20 = 30"
  end

  test "perform sqrt calculation" do
    visit calculators_url
    fill_in "calculator_a", with: "10"
    select "sqrt", from: "calculator_operation"

    click_on "Calculate!"

    assert_text "Square root of 10 = 3.1622776601683795"
  end

  test "rise error when field a and b is empty on simple calculation" do
    visit calculators_url
    select "+", from: "calculator_operation"

    click_on "Calculate!"

    within('.number_a') do
      assert_text "can't be blank"
    end

    within('.number_b') do
      assert_text "can't be blank"
    end
  end

  test "rise error when only field a is empty on sqrt calculation" do
    visit calculators_url
    select "sqrt", from: "calculator_operation"

    click_on "Calculate!"

    within('.number_a') do
      assert_text "can't be blank"
    end

    within('.number_b') do
      assert_no_text "can't be blank"
    end
  end

end
