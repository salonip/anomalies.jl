module anomalies

  using ODBC
  using WeakRefStrings
  using DataFrames

  export
  # datautil.jl
    getdata, getconnection, closeconnection, executequery,

  # core.jl
    suddenpeaks

  include("datautil.jl")
  include("core.jl")
end # module
