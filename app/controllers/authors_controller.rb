class AuthorsController < ApplicationController
  def index
    authors = Author.all
    render json: authors, status: :ok
  rescue StandardError => e
    render json: { error: 'Error', message: e.message }, status: :unprocessable_entity
  end

  def show
    author = Author.find(params[:id])
    render json: author, status: :ok
  rescue StandardError => e
    render json: { error: 'Error', message: e.message }, status: :unprocessable_entity
  end

  def create
    author = Author.create!(author_params)
    render json: { author: author, message: 'created' }, status: :created
  rescue StandardError => e
    render json: { error: 'Error', message: e.message }, status: :unprocessable_entity
  end

  def update
    author = Author.find(params[:id])
    author.update(author_params)
    render json: { author: author, message: 'updated' }, status: :created
  rescue StandardError => e
    render json: { error: 'Error', message: e.message }, status: :unprocessable_entity
  end

  def destroy
    Author.find(params[:id]).destroy
    render json: {message: "deleted"}, status: :ok
  rescue StandardError => e
    render json: { error: 'Error', message: e.message }, status: :unprocessable_entity
  end

  private

  def author_params
    params.permit(:name, :bio)
  end
end
