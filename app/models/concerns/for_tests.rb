module ForTests
  MAX_CHAR = 1114111
  
  def self.included c
    c.extend ClassMethods
  end
  
  module ClassMethods
    def random_value_of attribute
      random_string rand(1..column_for_attribute(attribute).max_length)
    end
    
    def too_long_random_value_of attribute
      random_string column_for_attribute(attribute).max_length + 1
    end
    
    private
    
    def random_string length
      [*1..length].map do
        begin
          rand(MAX_CHAR).chr(Encoding.default_external.name)
        rescue
          retry
        end
      end.join
    end
  end
end
