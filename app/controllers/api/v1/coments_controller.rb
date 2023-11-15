
module Api
    module V1
        class ComentsController < ApplicationController

            def index
                coments = Coment.all
                render json: {status:'SUCCESS', message:'loaded Coments', data:coments},status: :ok
            end

            def create
                article = Article.find(params[:article_id])
                coment = article.Coments.create(coment_params)


                if coment.persisted?
                    render json: {status:'SUCCESS', message:'coments successfully created', data:coments},status: :ok
                else
                    render json: {status:'ERROR', message:'failed to create a comment', data:coment.errors.full_messages},status: :unprocessable_entity
                end
            end

            private

            def coment_params
                params.permit(:name)
            end
        end
    end
end