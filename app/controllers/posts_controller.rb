# coding: utf-8

class PostsController < ApplicationController

  before_filter :authenticate_user!

  def index
    @posts = Post.all(:order => "created_at DESC") #.allでPostを全て引っ張ってきて、oredr※オプションで降順にする
  end

  def show
    @post = Post.find(params[:id]) #Postの中からidのあるものを探す
    @comment = Post.find(params[:id]).comments.build
  end

  def new
    @post = Post.new #新しくPostタイプを作成
  end

  def create
    @post = Post.new(project_params) #
    if @post.save 
      redirect_to posts_path, notice: '作成されました！'
    else
      render action: 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post =Post.find(params[:id])
    if @post.update_attributes(project_params)
      redirect_to posts_path, notice: '更新されました！'
    else
      render action: 'edit'
    end
  end

  def destroy
    @post =Post.find(params[:id])
    @post.destroy
    # redirect_to posts_path
    render json: { post: @post }
  end


private
 
  def project_params
    params[:post].permit(:title ,:content)
      params.require(:post).permit(:title, :content, :avatar)
  end

  def set_project
    @post = Post.find(params[:id])
  end


end


#    posts GET    /posts(.:format)          posts#index
#          POST   /posts(.:format)          posts#create
# new_post GET    /posts/new(.:format)      posts#new
#edit_post GET    /posts/:id/edit(.:format) posts#edit
#     post GET    /posts/:id(.:format)      posts#show
#          PATCH  /posts/:id(.:format)      posts#update
#          PUT    /posts/:id(.:format)      posts#update
#          DELETE /posts/:id(.:format)      posts#destroy
#     root GET    /                         posts#index