module PhotosHelper
  def photo_navigation(photo)
    newer = Photo.find(:first, :conditions => ['id > ?', photo.id])
    older = Photo.find(:first, :conditions => ['id < ?', photo.id], :order => "id desc")
    out = ''
    out << (!newer.nil? ? link_to(image_tag("strangelove.jpg"), photo_url(newer), :class => "newer_photo") : empty_photo_nav_div("First Photo"))
    out << content_tag(:span, image_tag("strangelove.jpg"), :class => "current_photo")
    out << (!older.nil? ? link_to(image_tag("strangelove.jpg"), photo_url(older), :class => "older_photo") : empty_photo_nav_div("Last Photo"))
    out
  end
  
  def empty_photo_nav_div(message)
    content_tag(:div, message, :class => [message.downcase.gsub(" ", "_"), "empty_photo"].join(" "))
  end
end
