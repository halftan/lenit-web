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
        language: 'zh-CN',
        pick12HourFormat: true,
        pickSeconds: false
      });
      picker = $("[data-behavior~='datetime-picker']").data('datetimepicker');
      picker.setLocalDate(picker.getDate());      
    </script>
    HTML
    html.html_safe
  end

end
