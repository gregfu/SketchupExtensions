require 'sketchup.rb'
require 'extensions.rb'

module ElegantSoftware
  module MultiExtrude
    unless file_loaded?(__FILE__)
      extension = SketchupExtension.new('Multi Extrusion', 'es_multi_extrude/main')
      extension.description = 'Skethup multiface extrusion extension'
      extension.version = '1.0.0'
      extension.copyright = 'Elegant Software (c) 2017'
      extension.creator = "Elegant Software"
      Sketchup.register_extension(extension, true)
      file_loaded(__FILE__)
    end
  end
end
