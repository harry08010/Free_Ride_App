ActionView::Base.field_error_proc = Proc.new do |html_tag, instance_tag|
  # disable adding error element to html
  # so that the style won't change
  html_tag
end
