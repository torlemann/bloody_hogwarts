require 'rails_helper'

RSpec.describe 'student index' do
    
    before :each do
        student = Student.create!(name: "Casseopia Black", age: 14, house: "Slytherin")

        visit '/students'
    end

    it 'shows a list of students with info' do
        expect(page).to have_content("Casseopia Black")
        expect(page).to have_content("Slytherin")
    end

    it 'shows the average age of the students' do
        student2 = Student.create!(name: "Sirius Black", age: 16, house: "Slytherin")
        visit '/students'
        expect(page).to have_content("Average age: 15")
    end
end