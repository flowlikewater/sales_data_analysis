require('rspec')
require('retail')

describe("#String") do
  it("returns the total sales for an item") do
    expect("DM1182".totalKSH()).to(eq({:total_KSH => 5437286, :largest => "Mombasa"}))
  end
end
