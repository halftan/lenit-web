module ApplicationHelper

  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end
  
  def init_datetime_picker
    html = <<-HTML
    <script type="text/javascript" charset="utf-8">
      var picker = $("[data-behavior~='datetime-picker']");
      picker.datetimepicker({
        language: "#{I18n.locale}",
        pick12HourFormat: true,
        pickSeconds: false
      });
      picker = $("[data-behavior~='datetime-picker']").data('datetimepicker');
      picker.setLocalDate(picker.getDate());      
    </script>
    HTML
    html.html_safe
  end

  def form_actions form
    html = <<-HTML
    <div class="form-actions">
      #{form.button :submit, :class => 'btn-primary'}
      #{submit_tag t("simple_form.reset"), :type => :reset, :class => "btn btn-danger"}
      #{link_to t("app.back"), :back, :class => "btn btn-link"}
    </div>
    HTML
    html.html_safe
  end

end
