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
      redirect_to("/lessons/#{@lesson.number}/show")
    else
      render('lessons/new.html.erb')
    end
  end

  def show
    @lesson = Lesson.where(:number => params[:number]).take
    render('lessons/show.html.erb')
  end

  def edit
    @lesson = Lesson.where(:number => params[:number]).take
    render('lessons/edit.html.erb')
  end

  def update
    @lesson = Lesson.where(:number => params[:number]).take
    if @lesson.update(params[:lesson])
      redirect_to("/lessons/#{@lesson.number}/show")
    else
      render('lesson/edit.html.erb')
    end
  end

  def destroy
    @lesson = Lesson.where(:number => params[:number]).take
    @lesson.destroy
    redirect_to('/lessons')
  end

end
