class Course < ApplicationRecord
    validates :name, presence: true

    has_many :student_courses
    has_many :students, through: :student_courses

    def students_per_course
        students.count
    end
end
