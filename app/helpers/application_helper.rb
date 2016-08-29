module ApplicationHelper
  # Create a submit button with the given name with a cancel link
  # Accepts two arguments: Form object and the cancel link
  def submit_or_cancel(form, options = {:cancel_name => "Cancel"})
    form.submit(options[:submit_name]) + " or " + 
      link_to(options[:cancel_name], 'javascript:history.go(-1)',
        class: "cancel")
  end

  def language_selector
    if I18n.locale == :en
      link_to "VI", url_for(locale: "vi")
    else
      link_to "EN", url_for(locale: "en")
    end
  end
end
