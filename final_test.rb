require_relative "functions.rb"
require "minitest/autorun"
 
class TestCorrelation < MiniTest::Unit::TestCase 
 
  # Variables
  @@sums= {
    "2005"=>
    {"sum_deaths"=>764,
     "sum_births"=>6282,
     "sum_deaths_births"=>1245336,
     "sum_deaths_square"=>153122,
     "sum_births_square"=>10341672,
     "correlation"=>0.9891028},
     "2006"=>
    {"sum_deaths"=>715,
     "sum_births"=>5458,
     "sum_deaths_births"=>1005337,
     "sum_deaths_square"=>132661,
     "sum_births_square"=>7762052,
     "correlation"=>0.99024723},
     "2007"=>
    {"sum_deaths"=>730,
     "sum_births"=>7544,
     "sum_deaths_births"=>1411600,
     "sum_deaths_square"=>136836,
     "sum_births_square"=>14827936,
     "correlation"=>0.9905322},
     "2008"=>
    {"sum_deaths"=>723,
     "sum_births"=>8891,
     "sum_deaths_births"=>1652370,
     "sum_deaths_square"=>135627,
     "sum_births_square"=>20610843,
     "correlation"=>0.98769576},
     "2009"=>
    {"sum_deaths"=>700,
     "sum_births"=>8144,
     "sum_deaths_births"=>1476569,
     "sum_deaths_square"=>129292,
     "sum_births_square"=>17247070,
     "correlation"=>0.98823699},
    "total_rows" => 79
  }


  def test_simple

  	# Pearson Correlation between Death and Births for years 2005-2009
    ["2005", "2006", "2007", "2008", "2009"].each do |year|
      x = @@sums[year]["sum_deaths"]
      y = @@sums[year]["sum_births"]
      xy = @@sums[year]["sum_deaths_births"]
      x2 = @@sums[year]["sum_deaths_square"]
      y2 = @@sums[year]["sum_births_square"]
      assert_equal(@@sums[year]["correlation"], pearson_correlation(x,y, xy, x2, y2,@@sums["total_rows"]).round(8))
    end
  end

end
