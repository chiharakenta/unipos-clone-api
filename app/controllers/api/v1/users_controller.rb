module Api
  module V1
    class UsersController < ApplicationController

      def index
        users = User.order(created_at: :desc)
        render json: { status: 'SUCCESS', data: users }
      end

      def show
        user = User.find(params[:id])
        user = {
          id: user.id,
          name: user.name,
          point: user.point.amount,
          received_point: user.received_point.amount
        };
        render json: { status: 'SUCCESS', data: user }
      end

      def create
        if user = User.find_or_create_by(google_id: user_params[:google_id], name: user_params[:name])
          render json: { status: 'SUCCESS', data: user }
        else
          render json: { status: 'ERRORS', data: user.errors }
        end
      end

      def destroy
        user = Post.find(params[:id])
        if user.destroy
          render json: { status: 'SUCCESS', data: user }
        else
          render json: { status: 'ERRORS', data: user.errors }
        end
      end


      private

      def user_params
        params.require(:user).permit(:google_id, :name)
      end

    end
  end
end
