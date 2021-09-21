require 'test_helper'

class ClockingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clocking = clockings(:one)
  end

  test 'should get index' do
    get clockings_url, as: :json
    assert_response :success
  end

  test 'should create clocking' do
    assert_difference('Clocking.count') do
      post clockings_url,
           params: { clocking:
           { details: @clocking.details, duration: @clocking.duration, topic: @clocking.topic } }, as: :json
    end

    assert_response 201
  end

  test 'should show clocking' do
    get clocking_url(@clocking), as: :json
    assert_response :success
  end

  test 'should update clocking' do
    patch clocking_url(@clocking),
          params: { clocking:
          { details: @clocking.details, duration: @clocking.duration, topic: @clocking.topic } }, as: :json
    assert_response 200
  end

  test 'should destroy clocking' do
    assert_difference('Clocking.count', -1) do
      delete clocking_url(@clocking), as: :json
    end

    assert_response 204
  end
end
