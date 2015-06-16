require "csv"
def percentage(x, y)
  x=x.to_i
  y=y.to_i
  x.to_f/y*100
end

def pearson_correlation(x,y,n)
  x=x.to_f
  y=y.to_f
  xy = x*y
  x2 = x*x
  y2 = y*y
  (( n *(xy)) - (x * y)) / Math.sqrt( (  (n * x2) - (x * x)) * ((n * y2) - (y * y)) )
end

infant_mortality_file="infant-mortality.1.csv"
parental_care_file="parental-care.1.csv"

f = File.open("infant-mortality.1.csv")
n = f.each_line.count
    printf("%-6s","Area#")
    printf("%-24s","Area")
    printf("%-8s","p 2005")
    printf("%-7s","c 2005")
    printf("%-8s","p 2006")
    printf("%-7s","c 2006")
    printf("%-8s","p 2007")
    printf("%-7s","c 2007")
    printf("%-8s","p 2008")
    printf("%-7s","c 2008")
    printf("%-8s","p 2009")
    printf("%-7s","c 2009\n")
infant_mortality_file = CSV.open(infant_mortality_file,"r", headers: true)
parental_care_file = CSV.open(parental_care_file, "r", headers: true)
(1..n-1).each do
parental_care = parental_care_file.readline
infant_mortality =infant_mortality_file.readline
  printf("%-6s", parental_care["Community Area Number"])
  printf("%-24s", parental_care["Community Area Name"])
  printf("%-8.1f", percentage(infant_mortality["Deaths 2005"],parental_care["Births 2005"]) )
  printf("%-7.1f", pearson_correlation(infant_mortality["Deaths 2005"],parental_care["Births 2005"],n) )
  printf("%-8.1f", percentage(infant_mortality["Deaths 2006"],parental_care["Births 2006"]) )
  printf("%-7.1f", pearson_correlation(infant_mortality["Deaths 2006"],parental_care["Births 2006"],n) )
  printf("%-8.1f", percentage(infant_mortality["Deaths 2007"],parental_care["Births 2007"]) )
  printf("%-7.1f", pearson_correlation(infant_mortality["Deaths 2007"],parental_care["Births 2007"],n) )
  printf("%-8.1f", percentage(infant_mortality["Deaths 2008"],parental_care["Births 2008"]) )
  printf("%-7.1f", pearson_correlation(infant_mortality["Deaths 2008"],parental_care["Births 2008"],n) )
  printf("%-8.1f", percentage(infant_mortality["Deaths 2009"],parental_care["Births 2009"]) )
  printf("%-7.1f", pearson_correlation(infant_mortality["Deaths 2009"],parental_care["Births 2009"],n) )
  printf("\n")
end


