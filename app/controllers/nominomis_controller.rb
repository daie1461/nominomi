class NominomisController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def index
      @nominomis = Nominomi.all


      if params[:tag_ids]
       @nominomis = []
       params[:tag_ids].each do |key, value|
        if value == "1"
          tag_nominomis = Tag.find_by(name: key).nominomis
          @nominomis = @nominomis.empty? ? tag_nominomis : @nominomis & tag_nominomis
        end
       end 
      end
  
      if params[:tag]
      Tag.create(name: params[:tag])

      
    end


  end

  def new
    @nominomi = Nominomi.new
  end

  def create
    nominomi = Nominomi.new(nominomi_params)
    
    nominomi.user_id = current_user.id
    
    if nominomi.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end

  end

  def show
    @nominomi = Nominomi.find(params[:id])

    @comments = @nominomi.comments
    @comment = Comment.new

  end


  def edit
    @nominomi = Nominomi.find(params[:id])
  end


  def update
    nominomi = Nominomi.find(params[:id])
    if nominomi.update(nominomi_params)
      redirect_to :action => "show", :id => nominomi.id
    else
      redirect_to :action => "new"
    end
  end


  def destroy
    nominomi = Nominomi.find(params[:id])
    nominomi.destroy
    redirect_to action: :index
  end


  def seibu
    @nominomis = Nominomi.where(area:"seibu")
  end

  def tobu
    @nominomis = Nominomi.where(area:"tobu")
  end

  def fukutoshin
    @nominomis = Nominomi.where(area:"fukutoshin")
  end

  def toshin
    @nominomis = Nominomi.where(area:"toshin")
  end





  private
  def nominomi_params
    params.require(:nominomi).permit(:spotname, :time, :seat, :menu, :tips, :tabe, :image,:lat,:lng, :area, tag_ids: [])
  end


end
