using anomalies
datasource_name = "introact_db"
sqlquery = "select value from ohlc_transaction where field_id = 561 and stock_id = 10;"
timeserise = getdata(datasource_name, sqlquery)

function suddenpeaks(timeserise)
  deriv = timeserise[1:end-1] .- timeserise[2:end]
  labelset = getlabel(deriv)
  xloc = findin(labelset, 4)
  trend = timeserise[xloc]
  lst = zeros(length(timeserise))
  st = std(trend)
  for i = 1:length(xloc)
    if timeserise[xloc[i]] > st
      lst[xloc[i]] = 1
    end
  end
  return lst
end


function getlabel(deriv)
  labelset = Array{Float64}(size(deriv))
  for i = 1:length(deriv) - 1
    if deriv[i] < 0 && deriv[i+1] < 0
      labelset[i] = 1
    elseif deriv[i] > 0 && deriv[i+1] > 0
      labelset[i] = 2
    elseif deriv[i] > 0 && deriv[i+1] < 0
      labelset[i] = 3
    else
      labelset[i] = 4
    end
  end
  return labelset
end
