
function suddenpeaks(timeserise)
  deriv = timeserise[1:end-1] .- timeserise[2:end]
  labelset = getlabel(deriv)
  xloc = findin(labelset, 3)
  trend = timeserise[xloc]
  lst = zeros(length(timeserise))
  st = mean(trend) + (mean(trend) - std(trend))
  for i = 1:length(xloc)
    if timeserise[xloc[i]] > st
      lst[xloc[i]] = 1
    end
  end


  # mx, my = [], []
  # for i = 1:length(lst)
  #   if lst[i] == 1
  #     push!(my,timeserise[i])
  #     push!(mx,i)
  #   end
  # end
  # using PyCall
  # @pyimport matplotlib.pyplot as plt
  # xaxis = collect(1:length(timeserise))
  # plt.plot(xaxis, timeserise, color="red", linewidth = 0.5)
  # plt.axhline(y=std(trend), color="green")
  # plt.axhline(y=mean(trend), color="blue")
  # plt.axhline(y=st, color="gray")
  # plt.plot(mx, my, "ro")
  # plt.show()
  # plt.savefig("image.jl")
  # plt.close()

  return lst
end

# using anomalies
# timeserise = getdata("/home/durjoysenmaitra/.julia/v0.5/anomalies.jl/all2/0102699000000143####CUSTOMER SERVICE TAX PAYMENT AXIS RTGS.txt", '|', 3)
# timeserise = timeserise .+ 200000
# timeserise[10] = 10000

function suddenfalls(timeserise)
  deriv = timeserise[1:end-1] .- timeserise[2:end]
  labelset = getlabel(deriv)
  xloc = findin(labelset, 4)
  trend = timeserise[xloc]
  lst = zeros(length(timeserise))
  st = mean(trend) - std(trend)
  for i = 1:length(xloc)
    if timeserise[xloc[i]] < st
      lst[xloc[i]] = 1
    end
  end
  # mx, my = [], []
  # for i = 1:length(lst)
  #   if lst[i] == 1
  #     push!(my,timeserise[i])
  #     push!(mx,i)
  #   end
  # end
  # using PyCall
  # @pyimport matplotlib.pyplot as plt
  # xaxis = collect(1:length(timeserise))
  # plt.plot(xaxis, timeserise, color="red", linewidth = 0.5)
  # plt.axhline(y=std(trend), color="green")
  # plt.axhline(y=mean(trend), color="blue")
  # plt.axhline(y=st, color="gray")
  # plt.plot(mx, my, "ro")
  # plt.show()
  # # plt.savefig("image.jl")
  # plt.close()
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
