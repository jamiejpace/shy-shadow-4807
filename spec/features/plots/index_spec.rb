require 'rails_helper'

RSpec.describe 'plot index page' do
  it 'lists all plot numbers and the names of all that plots plants' do
    garden = Garden.create!(name: "Jamie's Garden", organic: true)
    plot1 = garden.plots.create!(number: 1, size: "Large", direction: "West")
    plot2 = garden.plots.create!(number: 2, size: "Small", direction: "East")
    plant1 = Plant.create!(name: "Golden Tomato", description: "Medium sun", days_to_harvest: 50)
    plant2 = Plant.create!(name: "Special Lettuce", description: "Mostly shade, lots of water", days_to_harvest: 60)
    plant3 = Plant.create!(name: "String Beans", description: "Medium sun, rich soil", days_to_harvest: 70)
    plotplant1 = PlotPlant.create!(plant_id: plant1.id, plot_id: plot1.id)
    plotplant1 = PlotPlant.create!(plant_id: plant2.id, plot_id: plot1.id)
    plotplant1 = PlotPlant.create!(plant_id: plant3.id, plot_id: plot1.id)
    plotplant1 = PlotPlant.create!(plant_id: plant3.id, plot_id: plot2.id)
    visit plots_path

    save_and_open_page

    within "#plot-#{plot1.id}" do
      expect(page).to have_content(plot1.number)
      expect(page).to have_content(plant1.name)
      expect(page).to have_content(plant2.name)
      expect(page).to have_content(plant3.name)
    end

    within "#plot-#{plot2.id}" do
      expect(page).to have_content(plot2.number)
      expect(page).to_not have_content(plant1.name)
      expect(page).to_not have_content(plant2.name)
      expect(page).to have_content(plant3.name)
    end
  end
end
