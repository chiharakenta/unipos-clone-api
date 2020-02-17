module Api
  module V1
    class ReceivedPointsController < ApplicationController
      def create
        user = User.find(create_received_point_params[:user_id])
        # 既にポイントのデータがある場合、そのデータを返す
        if !user.received_point.nil?
          render json: { status: 'SUCCESS. point is already exist', data: user.received_point }
          return
        end

        # まだポイントなかった場合、作成してそのデータを返す
        received_point = user.build_received_point(amount: 100)
        if received_point.save
          render json: { status: 'SUCCESS', data: received_point }
        else
          render json: { status: 'ERRORS', data: received_point.errors }
        end
      end

      def update
        user = User.find(update_received_point_params[:user_id])
        if user.received_point.update(amount: update_received_point_params[:amount_change])
          render json: { status: 'SUCCESS', data: received_point }
        else
          render json: { status: 'ERRORS', data: received_point.errors }
        end
      end

      def decrease
        user = User.find(decrease_point_params[:user_id])
        if user.point_decrease(decrease_point_params[:point])
          render json: { status: 'SUCCESS', data: user.point }
        else
          render json: { status: 'ERRORS', data: user.point.errors }
        end
      end

      def increase
        user = User.find(increase_point_params[:user_id])
        if user.received_point_increase(increase_point_params[:point])
          render json: { status: 'SUCCESS', data: user.received_point }
        else
          render json: { status: 'ERRORS', data: user.received_point.errors }
        end
      end

      private

      def create_received_point_params
        params.require(:received_point).permit(:user_id)
      end

      def update_received_point_params
        params.require(:received_point).permit(:user_id, :amount_change, :type)
      end

      def increase_point_params
        params.permit(:user_id, :point)
      end
    end
  end
end
