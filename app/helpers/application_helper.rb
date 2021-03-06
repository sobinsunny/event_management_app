module ApplicationHelper
  def flash_class(level)
    case level.to_sym
    when :success then 'alert-success'
    when :error then 'alert-danger'
    when :notice then 'alert-info'
    end
  end

  def signed_in?
    current_user.present?
  end
end
