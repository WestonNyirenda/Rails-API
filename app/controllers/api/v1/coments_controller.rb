
module Api
    module V1
        class ComentsController < ApplicationController

            def index
                coments = Coment.all
                render json: {status:'SUCCESS', message:'loaded Coments', data:coments},status: :ok
            end

            def create
                article = Article.find(params[:article_id])
                coment = article.coments.create(coment_params)


                if coment.persisted?
                    render json: {status:'SUCCESS', message:'coments successfully created', data:coment},status: :ok
                else
                    render json: {status:'ERROR', message:'failed to create a comment', data:coment.errors.full_messages},status: :unprocessable_entity
                end
            end

            def destroy
                article = Article.find(params[:article_id])
                coment = article.coments.find(params[:id])
                coment.destroy
                render json: {status:'SUCCESS', message:'coment deleted successfully', data:coment},status: :ok
            end

            def update
                article = Article.find(params[:article_id])
                coment = article.coments.find(params[:id])

                if coment.update(coment_params)
                    render json: {status: 'SUCCESS', message: 'comment updated successfully', data:coment},status: :ok
                else
                    render json: {status: 'SUCCESS', message: 'Failed to update comment', data:coment},status: :ok
                end
            end

            private

            def coment_params
                params.permit(:name)
            end
            
            

           
        end
    end
end