module FormsHelper
  def add_new_field_link(name, form, object, partial)
    html = escape_javascript(fields_for_block(name, form, object, partial))   
    button_to_function(name, "insert_fields('#{html}', 'abcd', '.fields')")
  end

  def fields_for_block(name, form, object, partial)
    form.fields_for(:form_fields, object, :child_index => "abcd" ) do |f|
      render(:partial => partial, :locals => {:f => f})
    end
  end

  def generate_label_and_form_tag(form)
    form_field = form.object.form_field

    html = "<p>"
    case form_field.tag
    when "text_field"
      html += "<strong>" + (label :entry, "#{form_field.label}:") + "</strong>" + "<br />"
      html += text_field_tag form_field.label.underscore, ''
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
