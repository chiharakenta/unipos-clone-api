module Api
  module V1
    class PostsController < ApplicationController
      
      def index
        posts = Post.order(created_at: :desc)
        render json: { status: 'SUCCESS', data: posts }
      end

      def create
        user = User.find(post_params[:user_id])
        post = user.posts.build(post_params)
        if post.save
          render json: { status: 'SUCCESS', data: post }
        else
          render json: { status: 'ERRORS', data: post.errors }
        end
      end

      def destroy
        post = Post.find(params[:id])
        if post.destroy
          render json: { status: 'SUCCESS', data: post }
        else
          render json: { status: 'ERRORS', data: post.errors }
        end
      end


      private

      def post_params
        params.require(:post).permit(:user_id, :message, :introduced_user_id)
      end

    end
  end
end
