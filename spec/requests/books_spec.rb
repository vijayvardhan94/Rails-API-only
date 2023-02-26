require 'rails_helper'

#create the high leveldesribe block, with the type of test -> in this case its a request spec
describe 'Books API', type: :request do 
    describe 'GET /books' do
        it 'returns all books' do

            FactoryBot.create(:book, author:'Phil Knight', title:'Shoe Dog')
            FactoryBot.create(:book, author:'Zero to One', title:'Peter Thiel')

            get '/api/v1/books'
            expect(response).to have_http_status(:success)
            #expect(JSON.parse(response.body).size).to eq(4)
        end
    end

    describe 'GET /books/:id' do
        it 'returns one book' do
            book = FactoryBot.create(:book, author: 'J.K. Rowling', title: 'Harry Potter and the Philosopher\'s Stone')
            get "/api/v1/books/#{book.id}"

            expect(response).to have_http_status(:success)

            expect(JSON.parse(response.body)['id']).to eq(book.id)
            expect(JSON.parse(response.body)['title']).to eq(book.title)
            expect(JSON.parse(response.body)['author']).to eq(book.author)
        end
    end

    describe 'POST /books' do
        it 'creates a new book' do
            post '/api/v1/books', params: { book: {title: 'Martian', author: 'Andy Weir'}}
            expect(response).to have_http_status(:created)
        end
    end

end