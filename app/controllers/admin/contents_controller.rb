class Admin::ContentsController < Admin::ApplicationController
  layout false
  
  def edit
    @content = Content.find(params[:id])
    render :action => :edit
  end
  def update
    @content = Content.find(params[:id])
    if @content.update_attributes(params[:content])
      flash.now[:notice] = "Contenu dynamique mis à jour avec succès"
    else
      flash.now[:notice] = "Echec de la mise a jour du contenu dynamque"
      render :text => nil 
    end
  end

  
end
