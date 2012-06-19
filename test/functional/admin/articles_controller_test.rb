require 'test_helper'

class Admin::ArticlesControllerTest < ActionController::TestCase
  setup do
    @article = admin_articles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_articles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_article" do
    assert_difference('Admin::Article.count') do
      post :create, admin_article: { author: @article.author, body: @article.body, footer: @article.footer, notes: @article.notes, path: @article.path, status: @article.status, tags: @article.tags, title: @article.title }
    end

    assert_redirected_to admin_article_path(assigns(:admin_article))
  end

  test "should show admin_article" do
    get :show, id: @article
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @article
    assert_response :success
  end

  test "should update admin_article" do
    put :update, id: @article, admin_article: { author: @article.author, body: @article.body, footer: @article.footer, notes: @article.notes, path: @article.path, status: @article.status, tags: @article.tags, title: @article.title }
    assert_redirected_to admin_article_path(assigns(:admin_article))
  end

  test "should destroy admin_article" do
    assert_difference('Admin::Article.count', -1) do
      delete :destroy, id: @article
    end

    assert_redirected_to admin_articles_path
  end
end
