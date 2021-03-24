module Api
  module V1
    class PostsCommApiController <ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        posts=Post.where(mark_for_deletion: false).order(created_at: :desc).first(10)
        render json: {status: 200,message:'loaded posts',data:posts },status: :ok
      end
      def comments
        comments=Comment.where(post_id:params[:post_id]).order(created_at: :desc).limit(10)
        render json: {status: 200,message:'loaded comments',data:comments },status: :ok
      end
      def createComment
        comment=Comment.new(params.permit(:post_id,:body))
        comment.created_at=Time.now
        if comment.save
          render json:  {status: 200,data:comment},status: :ok
        else
          render json: {errors:{body:"can't be blank"}},status:500
        end
      end
      def updateComment

        comment=Comment.find_by(id: params[:comment_id])
        if comment.present? && comment.update(params.permit(:body))
          render json:  {status: 200,data:comment},status: :ok
        else
          render json: {errors:{msg:"Comment not found"}},status:500
        end
      end
      def deleteComment
        comment=Comment.find(params[:comment_id])
        if comment.destroy
          render json:  {status: 200},status: :ok
        else
          render json: {errors:{msg:"Comment not found"}},status:500
        end
      end
    end
  end
end