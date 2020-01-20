module Api
  module V1
    class PostsController < ApplicationController
      
      def index
        posts = Post.order(created_at: :desc)
        render json: { status: 'SUCCESS', data: posts }
      end

      def create
        post = Post.new(post_params)
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
        params.require(:post).permit(:message)
      end

    end
  end
end
