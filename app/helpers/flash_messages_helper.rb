module FlashMessagesHelper
  def display_flash_messages(type)
    return if flash[type].nil?

    bootstrap_class = bootstrap_class_for_flash_type(type)
    content_tag :div, flash[type].html_safe, class: bootstrap_class
  end

  private

  def bootstrap_class_for_flash_type(type)
    case type
    when 'notice'
      'alert alert-info'
    when 'success'
      'alert alert-success'
    when 'error'
      'alert alert-danger'
    when 'alert'
      'alert alert-warning'
    else
      "alert alert-#{type}"
    end
  end
end
