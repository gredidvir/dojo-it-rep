module ApplicationHelper
  def my_name
    "Dvir Gredi"
  end

  def form_group_tag(errors, &block)
   if errors.any?
     content_tag :div, capture(&block), class: 'form-group has-error'
   else
     content_tag :div, capture(&block), class: 'form-group'
   end
  end

  def markdown(text)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render text).html_safe
  end

  def vote_link_classes(post, vote_option)
    voted = 'glyphicon'
    if vote_option == 'up'
      voted << ' glyphicon-chevron-up' 
      voted << ' voted' if current_user.voted(post) && current_user.voted(post).up_vote?
    elsif vote_option == 'down'
      voted << ' glyphicon-chevron-down'
      voted << ' voted' if current_user.voted(post) && current_user.voted(post).down_vote?
    end
    voted
  end
end

