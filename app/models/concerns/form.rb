module Form
  def self.included c
    c.extend ClassMethods
  end
  
  def custom_field attribute, subject
    sufix = "_tag" unless subject.class == ActionView::Helpers::FormBuilder
    arguments = sufix ? [nil, attribute] : [attribute]
    limit = self.column_for_attribute(attribute).limit
    case attribute
    when /file/i
      subject.send "file_field#{sufix}", attribute, value: self.send(attribute)
    when /time/i
      subject.send "number_field#{sufix}", attribute, value: self.send(attribute)
    else
      case self.column_for_attribute(attribute).type
      when :boolean
        raise "todo"
      when :date
        subject.send "date_select", attribute, value: self.send(attribute)
      when :money
        subject.send "number_field#{sufix}", *arguments, value: self.send(attribute)
      when :text
        subject.send "text_area#{sufix}", *arguments, value: self.send(attribute), size: "70x10"
      else
        subject.send "text_field#{sufix}", *arguments, value: self.send(attribute), maxlength: limit
      end
    end
  end
  
  module ClassMethods
    def presentative_attributes
      persistable_attribute_names - %w(id created_at updated_at)
    end
  end
end
