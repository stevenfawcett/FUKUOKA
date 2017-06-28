module ApplicationHelper

  def full_title(page_title = '')
    if page_title.empty?
      TrelloAPI::Application.config.base_title
    else
      page_title + " | " + TrelloAPI::Application.config.base_title
    end
  end

  def title()
        TrelloAPI::Application.config.base_title
  end
   
  def subtitle()
    TrelloAPI::Application.config.sub_title
  end 
  
end
