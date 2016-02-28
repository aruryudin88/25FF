module CustomField
  METHOD_OF_TYPE = {
    file: "file_field",
    time: "number_field",
    boolean: "check_box",
    date: "date_select",
    money: "number_field",
    text: "text_area",
    string: "text_field",
    nil: "text_field"
  }
  
  def custom_field attribute, subject
    sufix = "_tag" unless subject.class == ActionView::Helpers::FormBuilder
    arguments = [attribute]
    data_type = column_for_attribute(attribute).type
    
    if /(file|time)/i =~ attribute
      data_type = $1.to_sym
      arguments.push({})
    else
      sufix = nil if data_type == :date
      arguments.push(data_type == :text ? self.send(attribute) : attribute) if sufix
      arguments.push maxlength: column_for_attribute(attribute).max_length
    end
    
    arguments.last.merge!((data_type == :text) ? {} : { value: self.send(attribute) })
    subject.send(method_name(data_type, sufix), *arguments)
  end
  
  private
  
  def method_name data_type, sufix
    prefix = METHOD_OF_TYPE[data_type]
    "#{(prefix || METHOD_OF_TYPE[nil])}#{sufix}"
  end
  
end
