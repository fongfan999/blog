module ApplicationHelper
  # Create a submit button with the given name with a cancel link
  # Accepts two arguments: Form object and the cancel link
  def submit_or_cancel(form, options = {:cancel_name => "Cancel"})
    link_to(options[:cancel_name],
      'javascript:history.go(-1)', class: "cancel") + " or " +
      form.submit(options[:submit_name])

  end
end
