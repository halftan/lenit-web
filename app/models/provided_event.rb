class ProvidedEvent < Event
  belongs_to :owner, :class_name => "Provider"
end