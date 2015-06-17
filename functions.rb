def percentage(x, y)
  x=x.to_i
  y=y.to_i
  x.to_f/y*100
end

def pearson_correlation(x,y, xy, x2, y2,n)
  x=x.to_f
  y=y.to_f
  xy = xy.to_f
  x2 = x2.to_f
  y2 = y2.to_f
  n  = n.to_f
  (( n *(xy)) - (x * y)) / Math.sqrt( (  (n * x2) - (x * x)) * ((n * y2) - (y * y)) )
end
