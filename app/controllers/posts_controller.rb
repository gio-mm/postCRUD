class PostsController < ApplicationController

    def show

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