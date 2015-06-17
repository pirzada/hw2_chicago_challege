require "csv"
require "pry"

def table_start
  puts "<table>"
end
def table_end
  puts "</table>"
end
def table_row(data=[])
  html = "<tr>"
  data.each do |data_val|
    html += "<td>"
    html +=  "#{data_val}"
    html += "</td>"
  end
  html += "</tr>"
  puts html
end

require_relative "functions.rb"

infant_mortality_file="infant-mortality.1.csv"
parental_care_file="parental-care.1.csv"

f = File.open("infant-mortality.1.csv")
n = f.each_line.count
#header row
table_start
table_row(["Area#","Area","p 2005","c 2005","p 2006","c 2006","p 2007","c 2007","p 2008","c 2008","p 2009","c 2009"])

infant_mortality_file = CSV.open(infant_mortality_file,"r", headers: true)
parental_care_file = CSV.open(parental_care_file, "r", headers: true)
sums = {
  "2005" => {
    "sum_deaths" => 0,
    "sum_births" => 0,
    "sum_deaths_births" => 0,
    "sum_deaths_square" => 0,
    "sum_births_square" => 0,
  },
  "2006" => {
    "sum_deaths" => 0,
    "sum_births" => 0,
    "sum_deaths_births" => 0,
    "sum_deaths_square" => 0,
    "sum_births_square" => 0,
  },
  "2007" => {
    "sum_deaths" => 0,
    "sum_births" => 0,
    "sum_deaths_births" => 0,
    "sum_deaths_square" => 0,
    "sum_births_square" => 0,
  },
  "2008" => {
    "sum_deaths" => 0,
    "sum_births" => 0,
    "sum_deaths_births" => 0,
    "sum_deaths_square" => 0,
    "sum_births_square" => 0,
  },
  "2009" => {
    "sum_deaths" => 0,
    "sum_births" => 0,
    "sum_deaths_births" => 0,
    "sum_deaths_square" => 0,
    "sum_births_square" => 0,
  }
}
(1..n-1).each do
  parental_care = parental_care_file.readline
  infant_mortality =infant_mortality_file.readline
  table_r = []
  table_r << parental_care["Community Area Number"]
  table_r << parental_care["Community Area Name"]
  ["2005", "2006", "2007", "2008", "2009"].each do |year|
    x = infant_mortality["Deaths #{year}"].to_i
    y = parental_care["Births #{year}"].to_i
    table_r << percentage(x, y).round(4)
    table_r << ""
    sums["#{year}"]["sum_deaths"] += x
    sums["#{year}"]["sum_births"] += y
    sums["#{year}"]["sum_deaths_births"] += x*y
    sums["#{year}"]["sum_deaths_square"] += x*x
    sums["#{year}"]["sum_births_square"] += y*y
  end
  table_row(table_r)
end
table_r = []
#Last correlation row
table_r << ""
table_r << ""
["2005", "2006", "2007", "2008", "2009"].each do |year|
  x=sums[year]["sum_deaths"]
  y=sums[year]["sum_births"]
  xy=sums[year]["sum_deaths_births"]
  x2=sums[year]["sum_deaths_square"]
  y2=sums[year]["sum_births_square"]
  table_r << ""
  sums[year]["correlation"] = pearson_correlation(x,y, xy, x2, y2,n).round(8)
  table_r << sums[year]["correlation"]
end
table_row(table_r)
table_end
