class ActionView::Base
  self.field_error_proc = Proc.new do |html_tag, instance|
    error_class_name = "error_field"
    if html_tag.match(/class="/)
      html_tag.sub(/class="/){|attribute| attribute<<" #{error_class_name} " }
    elsif html_tag.match(/<(label|input|select|textarea)/)
      html_tag.sub(/<(label|input|select|textarea)/){|tag| tag << " class='#{error_class_name}' " }
    end
  end

  def labelled_form_for(record_or_name_or_array, *args, &proc)
    options = args.extract_options!.symbolize_keys!
    form_for(record_or_name_or_array, *(args << options.merge(:builder => LabelledFormBuilder)), &proc)
  end

  def render_j(*agrs)
    escape_javascript render(*agrs)
  end
end