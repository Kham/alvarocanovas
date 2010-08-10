class LabelledFormBuilder < ActionView::Helpers::FormBuilder

  helpers = field_helpers +
            %w{date_select datetime_select time_select} +
            %w{select collection_select grouped_collection_select} -
            %w(label check_box radio_button fields_for hidden_field)

  helpers.each do |selector|
    define_method selector do |field, *args|
      options = args.last.is_a?(Hash) ? args.pop : {}
      @template.content_tag :div, :class => "form_line" do
        (label options[:id] || field) + super
      end
    end
  end

end

