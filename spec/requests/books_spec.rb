require 'rails_helper'

#create the high leveldesribe block, with the type of test -> in this case its a request spec
describe 'Books API', type: :request do 
    it 'returns all books' do

        FactoryBot.create(:book, author:'Phil Knight', title:'Shoe Dog')
        FactoryBot.create(:book, author:'Zero to One', title:'Peter Thiel')

        get '/api/v1/books'
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body).size).to eq(2)
    end
end