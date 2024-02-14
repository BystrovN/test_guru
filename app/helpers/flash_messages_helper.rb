module FlashMessagesHelper
  def display_flash_messages(type)
    return if flash[type].nil?

    content_tag :p, flash[type], class: "flash #{type}"
  end
end
