class Admin::CategoriesController < Admin::ApplicationController
  layout false
  
  def index
    @categories = Category.includes(:pictures)
    render :action => :list, :layout =>'admin'
  end

  def list
    @categories = Category.paginate :page => params[:page]
  end

  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      flash.now[:notice] = "Reportage mis a jour avec succès"
      respond_to_parent { render :action => 'update.js.erb' }
    else
      flash.now[:notice] = "Echec de la mise a jour du reportage"
      respond_to_parent { render :action => 'edit.js.erb' }
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash.now[:notice] = "Reportage supprimé avec succés"
    else
      flash.now[:notice] = "Impossible de supprimer le reportage"
      render :action => 'update.js.erb'
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      flash.now[:notice] = "Reportage créé avec succés"
      respond_to_parent { render :action => 'create.js.erb' }
    else
      flash.now[:notice] = "Echec de la création du reportage"
      respond_to_parent { render :action => 'new.js.erb' }
    end
  end

  def show
    @category = Category.find(params[:id])
  end
  
  def reorder
    params[:ordered_ids].each_with_index do |category_id, index|
      Category.find(category_id).update_attribute(:number, index + 1)
    end
    render :text => nil
  end

end
