require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest

  def setup
    @admin_user = mock_admin_user
    log_in_as(mock_admin_user)
  end

  test 'get new category form and create category' do
    get '/categories/new'
    assert_response :success
    assert_difference 'Category.count', 1 do
      post categories_path, params: { category: { name: 'Travel' } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match 'Travel', response.body
  end

  test 'get new category form and reject invalid category' do
    get '/categories/new'
    assert_response :success
    assert_difference 'Category.count', 0 do
      post categories_path, params: { category: { name: ' ' } }
    end
    assert_match 'The following errors prevented the category from being saved', response.body
    assert_select 'div.alert'
    assert_select 'h4.alert-heading'
  end
end
