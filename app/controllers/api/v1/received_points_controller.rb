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
        received_point = ReceivedPoint.find(params[:id])
        if received_point.update(amount: update_received_point_params[:amount])
          render json: { status: 'SUCCESS', data: received_point }
        else
          render json: { status: 'ERRORS', data: received_point.errors }
        end
      end

      private

      def create_received_point_params
        params.require(:received_point).permit(:user_id)
      end

      def update_received_point_params
        params.require(:received_point).permit(:amount)
      end
    end
  end
end
