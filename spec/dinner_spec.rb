# Dinner must be: Delicious
#           - Good balance of flavour
# Dinner must be: Nutritious
#           - Should provide at least 50% of RDA vitamins
#           - Should not exceed daily limits of bad stuff
# Dinner must be: Conscientious
#           - Ingredients sourced from approved suppliers
# Dinner must be: Delivered-to-us
#           - Maximum 30 mins from ordering to delivery

describe 'my dinner' do
  it 'is delicious' do
    my_dinner = Dinner.new    
    expect(my_dinner.flavour_score).to be > 80
  end  

  describe 'is nutritious' do
    it "and provides at least 50% RDA vitamins" do
      my_dinner = Dinner.new    
      expect(my_dinner.rda_vitamins).to all (be >= 50)
    end
    it "and does not exceept recommended daily 'bad stuff'" do
      my_dinner = Dinner.new
      expect(my_dinner.bad_stuff.values).to_not include("high")
    end
  end

  it 'is consciencious' do
    my_dinner = Dinner.new
    expect(approved_suppliers).to include(my_dinner.supplier) 
  end

  it 'is delivered-to-us' do
    my_dinner = Dinner.new
    expect(my_dinner.time_arrived - my_dinner.time_ordered).to be <= (30 * 60)
  end

end

class Dinner
  def flavour_score
    97
  end
  def rda_vitamins
    [88,98,81,72,65,54,67,96,78]
  end
  def bad_stuff
    { "saturated_fat" => "low", "sugars" => "low", "salt" => "med" }
  end
  def supplier
    "Nice farm"
  end
  def time_ordered
    Time.now - ( 24 * 60 )
  end
  def time_arrived
    Time.now
  end
end

def approved_suppliers
  [ "Nice farm", "Sustainable Veg co.", "Fairtrade supplies" ]
end