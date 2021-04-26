require 'rails_helper'

describe Movie do
    
    describe 'Search directors' do

        before :each do
            @movie00 = FactoryBot.create(:movie, :director => 'George')
            @movie01 = FactoryBot.create(:movie, :title => "Friends", :director => 'George')
            @movie02 = FactoryBot.create(:movie, :title => "Muppets", :director => 'Alan')
        end

        describe 'Happy path' do

            it 'should find movies by the same director' do
                results = Movie.find_same_directors('Alan')
                expect(results).to eq [@movie02]
            end
        end

        describe 'Sad path' do
            
            it 'should not find movies by other directors' do
                results = Movie.find_same_directors('George')
                results.each do |result|
                    expect(result.director).to eq 'George'
                end
            end

        end
        
    end
end