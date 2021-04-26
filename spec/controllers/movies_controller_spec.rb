require 'rails_helper'

describe MoviesController do
    
    describe '#search_directors' do

        describe 'Happy path' do
            before :each do
                movie = FactoryBot.create(:movie, :director => 'George')
            end

            it 'should redirect to a page with a list of movies with the same director' do
                get :search_directors, params: {:director => 'George'}
                expect(response).to render_template(:search_directors)
            end
        end
        
    end
end