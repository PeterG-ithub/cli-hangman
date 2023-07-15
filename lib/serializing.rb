# frozen_string_literal: true

require 'json'

def serialize(output_file, object)
  p object
  File.open(output_file, 'w') do |file|
    file.print JSON.dump(object)
  end
end

def deserialize(output_file)
  file = File.read(output_file)
  JSON.parse(file)
end
