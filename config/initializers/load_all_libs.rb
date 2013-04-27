Dir[Rails.root + 'lib/monkey_patch/*.rb'].each do |file|
  require file
end