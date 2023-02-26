module Api
  module V1
    class BooksController < ApplicationController
  
      def index
        render json: Book.all, status: :ok
      end

      def create
        #Book.create
        #title: params[:title], author: params[:author]
        book = Book.new(book_params)

        if book.save
          render json: book, status: :created
        else
          render json: book.errors, status: :unprocessable_entity
        end
      end

      def show
        book = Book.find(params[:id])
        render json: book
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Book doesnt exist with this Id" }, status: :not_found
      end

      def destroy

        Book.find(params[:id]).destroy!
        #to deal with exception use the destroy with a bang.
        head :no_content

      end

        private

        def book_params
          params.require(:book).permit(:title, :author)
        end
    end
  end
end

    