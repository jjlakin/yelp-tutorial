require 'rails_helper'

feature 'reviewing' do
	before {Restaurant.create name: 'KFC'}

	scenario 'allows user to leave review' do
		visit '/restaurants'
		click_link 'Review KFC'
		fill_in 'Thoughts', with: 'so so'
		select '3', from: 'Rating'
		click_button 'Leave Review'

		expect(current_path).to eq('/restaurants')
		expect(page).to have_content('so so')
	end

end

feature 'removing' do
	before do 
		restaurant  = Restaurant.create name: 'KFC' 
		restaurant.reviews.create(thoughts: 'so so')
	end

	scenario 'restaurant and review' do
		visit '/restaurants'
		
		expect(current_path).to eq('/restaurants')
		expect(page).to have_content('so so')
	end

end