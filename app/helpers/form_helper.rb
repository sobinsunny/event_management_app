module FormHelper
  # custom error message
  def error_message(form, feild)
    if form.object.errors[field].present?
      error_messsage =  form.object.errors[feild].try(:first).to_s
      content_tag(:div, error_messsage, class: 'help-inline')
    end
 end
end
