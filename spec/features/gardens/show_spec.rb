require 'rails_helper'

RSpec.describe 'garden show page' do
  before :each do
    @garden = Garden.create!(name: "Jamie's Garden", organic: true)
    @plot1 = @garden.plots.create!(number: 1, size: "Large", direction: "West")
    @plot2 = @garden.plots.create!(number: 2, size: "Small", direction: "East")
    @plot3 = @garden.plots.create!(number: 3, size: "Medium", direction: "East")
    @plant1 = Plant.create!(name: "Golden Tomato", description: "Medium sun", days_to_harvest: 50)
    @plant2 = Plant.create!(name: "Special Lettuce", description: "Mostly shade, lots of water", days_to_harvest: 60)
    @plant3 = Plant.create!(name: "String Beans", description: "Medium sun, rich soil", days_to_harvest: 70)
    @plant4 = Plant.create!(name: "Blue Watermelon", description: "Full sun, dry soil", days_to_harvest: 150)
    @plotplant1 = PlotPlant.create!(plant_id: @plant1.id, plot_id: @plot1.id)
    @plotplant1 = PlotPlant.create!(plant_id: @plant2.id, plot_id: @plot1.id)
    @plotplant1 = PlotPlant.create!(plant_id: @plant3.id, plot_id: @plot1.id)
    @plotplant1 = PlotPlant.create!(plant_id: @plant3.id, plot_id: @plot2.id)
    @plotplant1 = PlotPlant.create!(plant_id: @plant4.id, plot_id: @plot2.id)
    @plotplant1 = PlotPlant.create!(plant_id: @plant1.id, plot_id: @plot3.id)
    @plotplant1 = PlotPlant.create!(plant_id: @plant3.id, plot_id: @plot3.id)
    @plotplant1 = PlotPlant.create!(plant_id: @plant4.id, plot_id: @plot3.id)
    visit garden_path(@garden.id)
  end

  it 'lists unique plants for the garden that take less than 100 days to harvest' do

    expect(page).to have_content(@plant1.name, count: 1)
    expect(page).to have_content(@plant2.name)
    expect(page).to have_content(@plant3.name)
    expect(page).to_not have_content(@plant4.name)
  end

  xit 'lists the plants in order of how many times that plant has appeared in a plot in the garden from most to least' do
    expect(@plant1.name).to appear_before(@plant3.name)
    expect(@plant3.name).to appear_before(@plant2.name)
  end
end
