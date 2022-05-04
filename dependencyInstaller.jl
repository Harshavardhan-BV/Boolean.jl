using Pkg

packageList = ["CSV", "DataFrames", "DataFramesMeta",
"SparseArrays", "Lazy", "LinearAlgebra", "Pipe"]

x = keys(Pkg.installed())
for i in packageList
	if (!(i ∈ x))
	Pkg.add(i)
	end
end
