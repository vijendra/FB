module PatientsHelper
  def generate_label_and_form_tag(form)
    form_field = form.object.form_field

    html = "<p>"
    case form_field.tag
    when "text_field"
      html += "<strong>" + (label :entry, "#{form_field.label}:") + "</strong>" + "<br />"
      html += form.text_field form_field.label.underscore
    when "text_area"
      html += "<strong>" + (label :entry, "#{form_field.label}:") + "</strong>" + "<br />"
      html +=  text_area_tag form_field.label.underscore, '', :cols => 50, :rows => 6
    when "select"
      html += "<strong>" + (label :entry, "#{form_field.label}:") + "</strong>" + "<br />"
      html += select_tag form_field.label.underscore, options_for_select(form_field.values.split("\r\n")), :include_blank => "True"
    when "check_box"
      html += check_box_tag form_field.label.underscore
      html += " "
      html += "<strong>" + (label :entry, "#{form_field.label}") + "</strong>"
    when "date_select"
      html += "<strong>" + (label :entry_datetime, "#{form_field.label}:") + "</strong>" + "<br />"
      html +=  date_select :entry_datetime, :include_blank => true
    html += "</p>"
    end
  end
end
