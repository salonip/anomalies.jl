module anomalies

  using ODBC
  using WeakRefStrings
  using DataFrames

  export
  # datautil.jl
    getdata, getconnection, closeconnection, executequery,

  # core.jl
    suddenpeaks, suddenfalls

  include("datautil.jl")
  include("core.jl")
end # module
