using PyCall
@pyimport matplotlib.pyplot as plt


function plotanoms(xaxis, timeserise, peaks, path)
  mx, my = [], []
  for i = 1:length(peaks)
    if peaks[i] == 1
      push!(my,timeserise[i])
      push!(mx,i)
    end
  end
  plt.plot(xaxis, timeserise, color="red", linewidth = 0.5)
  plt.plot(mx, my, "ro")
  plt.savefig(path)
  plt.close()
end


function plotanoms(xaxis, timeserise, peaks)
  mx, my = [], []
  for i = 1:length(peaks)
    if peaks[i] == 1
      push!(my,timeserise[i])
      push!(mx,i)
    end
  end
  plt.plot(xaxis, timeserise, color="red", linewidth = 0.5)
  plt.plot(mx, my, "ro")
  plt.show()
  plt.close()
end


function plotxy(xaxis, timeserise, path)
  plt.plot(xaxis, timeserise, color="red", linewidth = 0.5)
  plt.savefig(path)
  plt.close()
end


function plotxy(xaxis, timeserise)
  plt.plot(xaxis, timeserise, color="red", linewidth = 0.5)
  plt.plot(mx, my, "ro")
  plt.show()
  plt.close()
end
