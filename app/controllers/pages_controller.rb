class PagesController < ApplicationController
  def index
    @pages = Page.all
  end

  def show
    
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)

    if @page.save #soon as this runs, the page has an id, so it can be accessed
     redirect_to page_path(@page.id)
    else
      render :new
    end
  end

  def page_params
    params.require(:page).permit(:title, :author, :body)
  end
end
