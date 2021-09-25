require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name: 'Sports')
    @admin_user = mock_admin_user
  end

  test 'should get index' do
    get categories_url
    assert_response :success
  end

  test 'should get new' do
    log_in_as(@admin_user)
    get new_category_url
    assert_response :success
  end

  test 'should show category' do
    get category_url(@category)
    assert_response :success
  end

  test 'should create category' do
    log_in_as(@admin_user)
    assert_difference('Category.count', 1) do
      post categories_url, params: { category: { name: 'Literature' } }
    end

    assert_redirected_to category_url(Category.last)
  end

  test 'should not create category if name is too short' do
    log_in_as(@admin_user)
    assert_difference('Category.count', 0) do
      post categories_url, params: { category: { name: 'Li' } }
    end

    assert_response :success
  end

  test 'should not create category if user not admin' do
    assert_no_difference('Category.count') do
      post categories_url, params: { category: { name: 'Li' } }
    end

    assert_redirected_to categories_url
  end
end
