# frozen_string_literal: true

module ApplicationHelper
  def bootstrap_class_for(flash_type)
    case flash_type.to_sym
    when :notice then 'alert-info'
    when :success then 'alert-success'
    when :error then 'alert-danger'
    when :alert then 'alert-warning'
    else "alert-#{flash_type}"
    end
  end

  def flash_messages(_opts = {})
    flash.each do |msg_type, message|
      concat(
        content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)}", role: 'alert') do
          concat content_tag(:button, 'x', class: 'close', data: { dismiss: 'alert' })
          concat message
        end
      )
    end
    nil
  end
end
