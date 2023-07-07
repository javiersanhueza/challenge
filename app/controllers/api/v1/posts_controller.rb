module Api
  module V1
    class PostsController < ApplicationController

      # Method to get all posts
      def index
        posts = Post.order('created_at')
        render_success_response(posts)
      end

      # Method to create a post
      def create
        post = Post.new(post_params)
        if post.save
          render_success_response(post)
        else
          render_error_response(post)
        end
      end

      # Method to delete a post
      def destroy
        begin
          post = Post.find(params[:id])
          if post.destroy
            render_success_response(post)
          else
            render_error_response(post)
          end
        rescue ActiveRecord::RecordNotFound
          render json: {
            status: 'error',
            message: 'No se ha encontrado el registro'
          }, status: :unprocessable_entity
        end
      end

      # parameters to create post
      private
      def post_params
        params.permit(:name, :description)
      end

      # method to render a correct answer
      def render_success_response(post)
        render json: {
          status: 'success',
          message: 'Acción completada satisfactoriamente',
          data: post
        }, status: :ok
      end

      # method to render a failed response
      def render_error_response(post)
        render json: {
          status: 'error',
          errors: post.errors
        }, status: :unprocessable_entity
      end
    end
  end
end
