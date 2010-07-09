class TagsController < ResourceController::Base
  
  def create
    photo = Photo.find(params[:photo_id])
    tags = params[:tag][:name].split(" ").collect {|t| Tag.find_or_initialize_by_name(t) }.reject{|t| photo.tags.include?(t)}
    photo.tags << tags
    respond_to do |wants|
      wants.js { render :partial => "tag", :collection => photo.tags, :locals => {:photo => photo}, :layout => false }
      wants.html { redirect_to photo_url(photo)}
    end
  end

  def destroy
    tagging = Tagging.find(:first, :conditions => {:photo_id => params[:photo_id], :tag_id => params[:id]})
    if tagging.destroy
      respond_to do |wants| 
        wants.js { render :nothing => true }
        wants.html { redirect_to photo_url(params[:photo_id]) }
      end
    else
      respond_to do |wants|
        wants.js {render :text => "Unable to remove that tag.", :status => 500 }
        wants.html do
          flash[:error] = "Unable to remove that tag."
          redirect_to photo_url(params[:photo_id])
        end
      end
    end
  end
end
