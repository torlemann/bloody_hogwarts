require 'rails_helper'

RSpec.describe 'student show' do
    
    before :each do
        @student = Student.create!(name: "Casseopia Black", age: 14, house: "Slytherin")
        @course_1 = Course.create!(name: "Defense Against the Dark Arts")
        @course_2 = Course.create!(name: "Herbology")
        @course_3 = Course.create!(name: "Potions")
        StudentCourse.create(student_id: @student.id, course_id: @course_1.id)
        StudentCourse.create(student_id: @student.id, course_id: @course_2.id)
    end

    it "shows a list of the student's courses" do
        visit "/students/#{@student.id}"
        expect(page).to have_content(@student.name)
        expect(page).to have_content("Herbology")
        #save_and_open_page
    end
end