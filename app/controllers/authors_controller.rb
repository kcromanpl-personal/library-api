class AuthorsController < ApplicationController
  def index
    authors = Author.all
    render json: authors, status: :ok
  rescue StandardError => e
    render json: { error: 'Unable to show all authors' }, status: :unprocessable_entity
  end

  def show
    author = Author.find(params[:id])
    render json: author, status: :ok
  rescue StandardError => e
    render json: { error: 'Unable to show author' }, status: :unprocessable_entity
  end

  def create
    author = Author.create!(author_params)
    render json: author, status: :created
  rescue StandardError => e
    render json: { error: 'Unable to create author' }, status: :unprocessable_entity
  end

  def update
    author = Author.find(params[:id]).update(author_params)
    render status: :ok
  rescue StandardError => e
    render json: { error: 'Unable to update author' }, status: :unprocessable_entity
  end

  def destory
    Author.find(params[:id]).destroy
    render status: :ok
  rescue StandardError => e
    render json: { error: 'Unable to update author' }, status: :unprocessable_entity
  end

  private

  def author__params
    params.permit(:name, :bio)
  end
end
