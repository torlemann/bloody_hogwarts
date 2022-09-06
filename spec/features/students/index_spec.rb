require 'rails_helper'

RSpec.describe 'student index' do
    
    before :each do
        student = Student.create!(name: "Casseopia Black", age: 14, house: "Slytherin")

        visit '/students'
    end

    it 'shows a list of students with info' do
        expect(page).to have_content("Casseopia Black")
        expect(page).to have_content("Slytherin")
        save_and_open_page
    end
end