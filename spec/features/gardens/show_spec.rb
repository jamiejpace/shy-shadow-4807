require 'rails_helper'

RSpec.describe 'garden show page' do
  before :each do
    @garden = Garden.create!(name: "Jamie's Garden", organic: true)
    @plot1 = @garden.plots.create!(number: 1, size: "Large", direction: "West")
    @plot2 = @garden.plots.create!(number: 2, size: "Small", direction: "East")
    @plant1 = Plant.create!(name: "Golden Tomato", description: "Medium sun", days_to_harvest: 50)
    @plant2 = Plant.create!(name: "Special Lettuce", description: "Mostly shade, lots of water", days_to_harvest: 60)
    @plant3 = Plant.create!(name: "String Beans", description: "Medium sun, rich soil", days_to_harvest: 70)
    @plotplant1 = PlotPlant.create!(plant_id: @plant1.id, plot_id: @plot1.id)
    @plotplant1 = PlotPlant.create!(plant_id: @plant2.id, plot_id: @plot1.id)
    @plotplant1 = PlotPlant.create!(plant_id: @plant3.id, plot_id: @plot1.id)
    @plotplant1 = PlotPlant.create!(plant_id: @plant3.id, plot_id: @plot2.id)
    visit plots_path
  end

end
