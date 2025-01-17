include("bmodel.jl") 
using Base.Threads

minWt = 0.0
maxWt = 1.0
nPert = 100 # Number of samples of edge weights

fileList = readdir()
topoFiles = String[]
for i in fileList
    if endswith(i, "topo")
        push!(topoFiles, i)
    end
end

println(Threads.nthreads())

for topoFile in [topoFiles[2]]
    y2 = @elapsed xVe = edgeWeightPert(topoFile; nPerts = nPert, nInit = 10000, nIter = 1000,
            minWeight = minWt, maxWeight = maxWt)
end