require 'spec_helper'

describe 'App for processing' do
  context "Para productos fisicos" do
    it 'devuelve un paquete' do 
      product = "ProductoFisico"
      expect(AppForProcessing.process(product)).to eq(:paking_for_shipping)
    end  
  end
  
  context "Para libros" do
    
  end
end


class AppForProcessing
  def self.process(product)
    return :paking_for_shipping  if product == "ProductoFisico"
  end
end

