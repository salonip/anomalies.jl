function getdata(filename, separator, colno)
  return readdlm(filename, separator)[:,colno]
end

function getdata(filename)
  return readdlm(filename)
end

function getdata(datasource_name, sqlquery)
  try
    con = getconnection(datasource_name)
    data = executequery(con, sqlquery)
    closeconnection(con)
    return Array{Float64}(data)
  catch err
    warn("Database Error: $err")
    return false
  end
end

function getconnection(datasource_name)
	try
		con = ODBC.DSN(datasource_name)
		return con
	catch E
		return true
	end
end

function closeconnection(con)
		ODBC.disconnect!(con)
end

function executequery(con, querystring)
  nullable_data = ODBC.query(con, querystring)
	data = DataFrame()
	nm = names(nullable_data)
	new_array = Array{Any}(size(nullable_data))
	for i = 1:size(nullable_data,2)
		for j = 1:size(nullable_data,1)
			if typeof(get(nullable_data[j,i])) == WeakRefString{UInt8}
				new_array[j,i] = String(get(nullable_data[j,i]))
			else
				new_array[j,i] = get(nullable_data[j,i])
			end
		end
		data[nm[i]] = new_array[:,i]
	end
	return data
end
