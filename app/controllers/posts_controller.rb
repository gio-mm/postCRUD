class PostsController < ApplicationController

    def show
      @post=Post.where(id:params[:id],mark_for_deletion: false).first
      @comments=@post.comments.all
    end

    def index
      @posts=Post.where(mark_for_deletion: false).order(created_at: :desc).first(10)
    end

    def new
      @post = Post.new
    end
    def create

      @post=Post.new(params.require(:posts).permit(:title,:body))

      @post.created_at=Time.now

      # render plain: @post.inspect

      if @post.save
        flash[:notice]="Article was created successfully"

        redirect_to @post
      else
        render
      end

    end
    def edit

        @post=Post.where(id:params[:id],mark_for_deletion: false).first

    end



    def update

    end

    def destroy

    end


end