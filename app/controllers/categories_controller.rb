class CategoriesController < ApplicationController
  before_action :require_admin, only: %i[new create]
  before_action :category_params, only: %i[create]

  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.create(category_params)
    if @category.save
      flash[:notice] = 'Category successfully created'
      redirect_to @category
    else
      render 'new'
    end
  end

  private

  def category_params
    params.require('category').permit('name')
  end

  def require_admin
    return if admin_user?

    flash[:alert] = 'You are not authorised to perform this action !!'
    redirect_to categories_path
  end
end
