require 'rails_helper'

feature 'reviewing' do
  before {Restaurant.create name: 'KFC'}

  def leave_review(thoughts, rating)
    visit '/restaurants'
     click_link 'Review KFC'
     fill_in "Thoughts", with: thoughts
     select rating, from: 'Rating'
     click_button 'Leave Review'
   end


  scenario 'allows users to leave a review using a form' do
     leave_review('so so', '3')
     expect(current_path).to eq '/restaurants'
     expect(page).to have_content('so so')
  end

  scenario 'display avarage raiting' do
     leave_review('ok', '2')
     leave_review('very good', '4')
     expect(page).to have_content('Average rating: ★★★☆☆')
  end


end