module ApplicationHelper
  # Create a submit button with the given name with a cancel link
  # Accepts two arguments: Form object and the cancel link
  def submit_or_cancel(form, options = {:cancel_name => "Cancel"})
    form.submit(options[:submit_name]) + " or " + 
      link_to(options[:cancel_name], 'javascript:history.go(-1)',
        class: "cancel") 
  end
end
