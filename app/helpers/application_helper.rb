module ApplicationHelper

  def modal_button(text, target)
    content_tag(:button, text, type: 'button', class: 'btn btn-default btn-xs',
                data: {target: target, toggle: 'modal'})
  end
end
