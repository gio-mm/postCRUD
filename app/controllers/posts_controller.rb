class PostsController < ApplicationController

    def show
      @post=Post.where(id:params[:id],mark_for_deletion: false).first
      @comments=@post.comments.all
    end

    def index
      @posts=Post.where(mark_for_deletion: false).order(created_at: :desc).first(10)
    end

    def new

    end
    def create


    end
    def edit



    end



    def update

    end

    def destroy

    end


end