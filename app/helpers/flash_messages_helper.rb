module FlashMessagesHelper
  def display_flash_messages
    if flash[:alert].present?
      content_tag :p, flash[:alert], class: 'flash alert'
    elsif flash[:notice].present?
      content_tag :p, flash[:notice], class: 'flash notice'
    end
  end
end
