class Admin::PicturesController < Admin::ApplicationController

  before_filter :get_category

  def get_category
    @category = Category.find(params[:category_id])
  end

  def index
    @pictures = @category.pictures
  end

  def create
    @picture = @category.pictures.new(params[:picture])
    if @picture.save
      flash.now[:notice] = "Photographie enregistrée avec succés"
      respond_to_parent { render :action => 'create.js.erb' }
    else
      flash.now[:notice] = "Echec de l'enregistrement"
      respond_to_parent { render :action => 'new.js.erb' }
    end
  end

  def edit
    @picture = @category.pictures.find(params[:id])
  end

  def update
    @picture = @category.pictures.find(params[:id])
    if @picture.update_attributes(params[:picture])
      flash.now[:notice] = "Photographie mise à jour avec succés"
      respond_to_parent { render :action => 'update.js.erb' }
    else
      flash.now[:notice] = "Echec de la mise à jour de la photographie"
      render :action => :edit
    end
  end

  def show
    @picture = @category.pictures.find(params[:id])
  end

  def new
    @picture = @category.pictures.new
  end
  
  def reorder
    params[:ordered_ids].each_with_index do |picture_id, index| 
      Picture.find(picture_id).update_attribute(:number, index + 1)
    end
    render :text => nil    
  end
end
