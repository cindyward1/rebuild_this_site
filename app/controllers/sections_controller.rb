class SectionsController < ApplicationController

  def new
    @section = Section.new
    render('sections/new.html.erb')
  end

  def create
    @section = Section.new(params[:section])
    if @section.save
      flash[:notice] = "The section was saved to the database"
      redirect_to("/sections/#{@section.number}/show")
    else
      render('sections/new.html.erb')
    end
  end

  def show
    @section = Section.where(:number => params[:number]).take
    render('sections/show.html.erb')
  end

  def edit
    @section = Section.where(:number => params[:number]).take
    render('sections/edit.html.erb')
  end

  def update
    @section = Section.where(:number => params[:number]).take
    if @section.update(params[:section])
      flash[:notice] = "The section was updated in the database"
      redirect_to("/sections/#{@section.number}/show")
    else
      render('section/edit.html.erb')
    end
  end

  def destroy
    @section = Section.where(:number => params[:number]).take
    @section.lessons.each do |lesson|
      lesson.destroy
    end
    @section.destroy
    flash[:notice] = "The section was deleted from the database"
    redirect_to('/lessons')
  end

end
