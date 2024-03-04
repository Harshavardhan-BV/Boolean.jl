include("bmodel.jl") 
using Base.Threads

fileList = readdir()
topoFiles = String[]
for i in fileList
	if endswith(i, "_rand")
		push!(topoFiles, i)
	end
end

cwd = pwd()
println(Threads.nthreads())

for topoFile in topoFiles
	cd(cwd*"/"*topoFile)
	println(topoFile)
	topoFile = replace(topoFile, "_rand" => ".topo")
	datfileList = readdir()
	datFiles = String[]
	for i in datfileList
		if endswith(i, "dat")
			push!(datFiles, i)
		end
	end
	for datFile in datFiles
		y1 = @elapsed knownWeightPert(topoFile, datFile; nInit = 10000, nIter = 1000)
	end
end
