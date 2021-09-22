require 'rails_helper'

RSpec.describe Garden do
  describe 'relationships' do
    it { should have_many(:plots) }
  end

  describe 'instance methods' do
    describe '.unique_plants_short_harvest' do
      before :each do
        @garden = Garden.create!(name: "Jamie's Garden", organic: true)
        @plot1 = @garden.plots.create!(number: 1, size: "Large", direction: "West")
        @plot2 = @garden.plots.create!(number: 2, size: "Small", direction: "East")
        @plant1 = Plant.create!(name: "Golden Tomato", description: "Medium sun", days_to_harvest: 50)
        @plant2 = Plant.create!(name: "Special Lettuce", description: "Mostly shade, lots of water", days_to_harvest: 60)
        @plant3 = Plant.create!(name: "String Beans", description: "Medium sun, rich soil", days_to_harvest: 70)
        @plant4 = Plant.create!(name: "Blue Watermelon", description: "Full sun, dry soil", days_to_harvest: 150)
        @plotplant1 = PlotPlant.create!(plant_id: @plant1.id, plot_id: @plot1.id)
        @plotplant1 = PlotPlant.create!(plant_id: @plant2.id, plot_id: @plot1.id)
        @plotplant1 = PlotPlant.create!(plant_id: @plant3.id, plot_id: @plot1.id)
        @plotplant1 = PlotPlant.create!(plant_id: @plant3.id, plot_id: @plot2.id)
        @plotplant1 = PlotPlant.create!(plant_id: @plant4.id, plot_id: @plot2.id)
      end

      it 'find all the unique plants for a garden that have a harvest time less than 100 days and return the plant name' do
        expect(@garden.unique_plants_short_harvest.length).to eq(3)
        expect(@garden.unique_plants_short_harvest.first).to eq(@plant1.name)
      end
    end
  end
end
