module Api
    module V1
        class BooksController < ApplicationController
            def index
                books = Book.order('created_at DESC');
                render json: {status: 'Great', message:'Loaded books', data:books},status: :ok
            end
            def show
                book = Book.find(params[:id]);
                render json: {status: 'Great', message:'Loaded book', data:book},status: :ok
            end
            
            def create
                book = Book.new(book_params)

                if book.save
                render json: {status: 'Great', message:'Saved book', data:book},status: :ok
                else
                render json: {status: 'Error', message:'book not saved', data:book.errors},status: :unprocessable_entity
                end    
            end

            def destroy
                book = Book.find(params[:id]);
                book.destroy
                render json: {status: 'Great', message:'book deleted', data:book},status: :ok
            end
            
            def update
                book = Book.find(params[:id]);

                if book.update_attributes(book_params)
                render json: {status: 'Great', message:'updated book', data:book},status: :ok
                else
                render json: {status: 'Error', message:'book not updated', data:book.errors},status: :unprocessable_entity
                end 

            end    

            private

            def book_params
                params.permit(:title, :category, :author, :calification, :percentage)
            end    
        end    
    end    
end    