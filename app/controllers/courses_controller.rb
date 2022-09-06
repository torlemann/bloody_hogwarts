class CoursesController < ApplicationController
    def index
        @scourses = Course.all
    end