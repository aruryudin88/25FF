module ActiveRecordBaseExtension  
  extend ActiveSupport::Concern
  SERVICE_ATTRIBUTES = %w(id created_at updated_at)
  
  def presentative_attribute_names
    self.class.send __method__
  end
  
  def presentative_attributes
    attributes.except *SERVICE_ATTRIBUTES
  end
    
  module ClassMethods
    def presentative_attribute_names
      persistable_attribute_names - SERVICE_ATTRIBUTES
    end
  end
end
ActiveRecord::Base.send(:include, ActiveRecordBaseExtension)

module ActiveRecordConnectionAdaptersColumnExtension
  extend ActiveSupport::Concern
  DATA_TYPES = { string: 32, text: 65000 }
  
  def max_length
    @max_length ||= limit || max_length_by_type
  end
  
  def max_length_by_type
    @max_length_by_type ||= DATA_TYPES[type]
  end
end
ActiveRecord::ConnectionAdapters::Column.send(:include, ActiveRecordConnectionAdaptersColumnExtension)
