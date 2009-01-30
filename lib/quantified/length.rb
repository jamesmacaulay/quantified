module Quantified
  class Length < Attribute
    numeric_methods :metres, :centimetres, :inches, :feet
    
    system :metric do
      primitive :metre
      
      one :centimetre, :is => (0.01).metres
      one :millimetre, :is => (0.1).centimetres
      one :kilometre, :is => 1000.metres
    end
    
    system :imperial do
      primitive :inch
      one :inch, :is => (2.540).centimetres
      
      one :foot, :plural => :feet, :is => 12.inches
      one :yard, :is => 3.feet
      one :mile, :is => 5280.feet
    end
  end
end