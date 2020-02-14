module Api
  module V1
    class PostsController < ApplicationController
      
      def index
        posts = Post.order(created_at: :desc)
        new_posts = []
        posts.each do |post|
          introduced_user_name = User.find(post.introduced_user_id).name
          post = {
            id: post.id,
            message: post.message,
            introducing_user_name: post.user.name,
            introduced_user_name: introduced_user_name
          }
          new_posts.push(post)
        end
        render json: { status: 'SUCCESS', data: new_posts }
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
