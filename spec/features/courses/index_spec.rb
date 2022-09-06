require 'rails_helper'

RSpec.describe 'student index' do
    
    before :each do
        @student = Student.create!(name: "Casseopia Black", age: 14, house: "Slytherin")
        @course_1 = Course.create!(name: "Defense Against the Dark Arts")
        @course_2 = Course.create!(name: "Herbology")
        @course_3 = Course.create!(name: "Potions")
        StudentCourse.create(student_id: @student.id, course_id: @course_1.id)
        StudentCourse.create(student_id: @student.id, course_id: @course_2.id)

        visit '/courses'
    end

    it 'shows a list of courses and the students enrolled in them' do
        expect(page).to have_content("Herbology")
        expect(page).to have_content("Potions")
        expect(page).to have_content(@course_2.students_per_course)
        expect(page).to have_content(@course_3.students_per_course)
        save_and_open_page
    end
end