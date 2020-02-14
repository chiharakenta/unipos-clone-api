module Api
  module V1
    class PointsController < ApplicationController
      def create
        user = User.find(create_point_params[:user_id])

        # 既にポイントのデータがある場合、そのデータを返す
        if !user.point.nil?
          render json: { status: 'SUCCESS. point is already exist', data: user.point }
          return
        end

        # まだポイントなかった場合、作成してそのデータを返す
        point = user.build_point(amount: 100)
        if point.save
          render json: { status: 'SUCCESS', data: point }
        else
          render json: { status: 'ERRORS', data: point.errors }
        end
      end

      def update
        point = Point.find(params[:id])
        if point.update(amount: update_point_params[:amount])
          render json: { status: 'SUCCESS', data: point }
        else
          render json: { status: 'ERRORS', data: point.errors }
        end
      end

      private

      def create_point_params
        params.require(:point).permit(:user_id)
      end

      def update_point_params
        params.require(:point).permit(:amount)
      end
    end
  end
end