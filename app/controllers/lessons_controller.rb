class LessonsController < ApplicationController

  def table_of_contents
    @sections = []
    @sections = Section.all_number_order
    render('lessons/table_of_contents.html.erb')
  end

  def new
    @lesson = Lesson.new
    @sections = Section.all_number_order
    render('lessons/new.html.erb')
  end

  def create
    @sections = Section.all_number_order
    @section = Section.where(:number => params[:section_number]).take
    params[:lesson][:section_id] = @section.id
    @lesson = Lesson.new(params[:lesson])
    if @lesson.save
      flash[:notice] = "The lesson was saved to the database"
      redirect_to("/lessons/#{@lesson.number}/show")
    else
      render('lessons/new.html.erb')
    end
  end

  def show
    @lesson = Lesson.where(:number => params[:number]).take
    @section = Section.find(@lesson.section_id)
    render('lessons/show.html.erb')
  end

  def edit
    @sections = Section.all_number_order
    @lesson = Lesson.where(:number => params[:number]).take
    render('lessons/edit.html.erb')
  end

  def update
    @section = Section.where(:number => params[:section_number]).take
    params[:lesson][:section_id] = @section.id
    @lesson = Lesson.where(:number => params[:number]).take
    if @lesson.update(params[:lesson])
      flash[:notice] = "The lesson was updated in the database"
      redirect_to("/lessons/#{@lesson.number}/show")
    else
      render('lesson/edit.html.erb')
    end
  end

  def destroy
    @lesson = Lesson.where(:number => params[:number]).take
    @lesson.destroy
    flash[:notice] = "The lesson was deleted from the database"
    redirect_to('/lessons')
  end

end
