module Api
  module V1
    class ClapsController < ApplicationController
      
      def index
        claps = Clap.all
        render json: { status: 'SUCCESS', data: claps }
      end

      def create
        post = Post.find(clap_params[:post_id])
        clap = post.claps.build()
        if clap.save
          render json: { status: 'SUCCESS', data: clap }
        else
          render json: { status: 'ERRORS', data: clap.errors }
        end
      end

      private

      def clap_params
        params.require(:clap).permit(:post_id)
      end
      
    end
  end
end