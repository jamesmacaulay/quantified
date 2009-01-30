Quantified
==========

Pretty quantifiable measurements which feel like ActiveSupport::Duration.

Access whichever included attributes you want like so:

    require 'quantified/mass'
    require 'quantified/length'


Then you can do things like this (singular methods aren't added to Numeric):

    1.feet == 12.inches
    # => true
    
    18.inches.to_feet
    # => #<Quantified::Length: 1.5 feet>
    
    (2.5).feet.in_millimetres.to_s
    # => "762.0 millimetres"


You can easily define new attributes. Here's length.rb:

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
