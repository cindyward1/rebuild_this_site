class LessonsController < ApplicationController

  def table_of_contents
    @lessons = []
    @lessons = Lesson.all_number_order
    render('lessons/table_of_contents.html.erb')
  end

  def new
    @lesson = Lesson.new
    render('lessons/new.html.erb')
  end

  def create
    @lesson = Lesson.new(params[:lesson])
    if @lesson.save
      redirect_to('/lessons/show.html.erb')
    else
      render('lessons/new.html.erb')
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
    render('lesson/edit.html.erb')
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update(params[:lesson])
      redirect_to('/lessons/#{@lesson.id}')
    else
      render('lesson/edit.html.erb')
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    redirect_to('/lessons/table_of_contents.html.erb')
  end

end
