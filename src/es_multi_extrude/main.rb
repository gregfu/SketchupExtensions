module ElegantSoftware
  module MultiExtrude
    def self.multi_extrude
      model = Sketchup.active_model
      model.start_operation "MultiExtrude", true
      entities = model.selection.empty? ? model.active_entities : model.selection
      faces = entities.map{|e| e if e.is_a? Sketchup::Face}.compact
      distance = UI.inputbox(["Extrusion Distance"], [0.to_l], 'Distnace to Extrude')[0]
      faces.each do |e|
        e.pushpull distance.to_l, false
      end
      model.commit_operation
    end

    unless file_loaded?(__FILE__)
      menu = UI.menu('Extensions')
      menu.add_item('Multiface Extrusion') do
        self.multi_extrude
      end
      file_loaded(__FILE__)
    end
  end
end
