require 'rails_helper'

RSpec.describe PlotPlant do
  describe 'relationships' do
    it { should belong_to(:plot) }
    it { should belong_to(:plant) }

  describe 'class methods' do
    describe '#current_plot_plant' do
      it 'finds the current_plot_plant using plant and plot ids' do
        garden = Garden.create!(name: "Jamie's Garden", organic: true)
        plot1 = garden.plots.create!(number: 1, size: "Large", direction: "West")
        plant1 = Plant.create!(name: "Golden Tomato", description: "Medium sun", days_to_harvest: 50)
        plotplant1 = PlotPlant.create!(plant_id: plant1.id, plot_id: plot1.id)

        expect(PlotPlant.current_plot_plant(plant1.id, plot1.id)).to eq(plotplant1)
      end
    end
  end
  end
end
