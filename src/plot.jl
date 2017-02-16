using PyCall
@pyimport matplotlib.pyplot as plt
@pyimport pylab
function plotxy(x, y)
  plt.plot(x, y, color="red", linewidth=2.0, linestyle="--")
  plt.savefig("image.png")
end
