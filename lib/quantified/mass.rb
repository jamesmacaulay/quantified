module Quantified
  class Mass < Attribute
    numeric_methods :grams, :kilograms, :ounces, :pounds
    
    system :metric do
      primitive :gram
      
      one :milligram, :is => (0.001).grams
      one :kilogram, :is => 1000.grams
    end
    
    system :imperial do
      primitive :ounce
      one :ounce, :is => (28.349523125).grams
      
      one :pound, :is => 16.ounces
      one :stone, :is => 14.pounds
      one :short_ton, :is => 2000.pounds
    end
  end
end