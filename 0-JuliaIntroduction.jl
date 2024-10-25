### A Pluto.jl notebook ###
# v0.20.0

using Markdown
using InteractiveUtils

# ╔═╡ 28e23e08-c8bd-4eb0-a294-71b8788a0349
using SparseArrays

# ╔═╡ c7b437ed-e784-47e9-b555-67f9f19983ff
begin
	#J
	using LinearAlgebra 
	A = zeros(20, 15)
	A[1, 1:end] .= 1
	A[1:12, end] .= 1
	for i = 12:size(A, 1)
		for j = 1:size(A, 2)
			if isapprox(norm([12, 7.5]-[i, j]), 7.5, atol=0.5)
				A[i, j] = 1
			end
		end
	end
	sparse(A)
end

# ╔═╡ e50990fd-30e4-47de-ae83-d4c6e442990f
begin
	using Test
	# filled arrays
	# Vector
	a4 = [3, 3, 3]
	@show a4
	a5 = [1:10]
	@show a5
	# Matrix
	a6 = [1 1 1; 2 2 2; 3 3 3]
	@show a6
	a7 = rand(Int16, 5, 5)
	@show a7

	# access array values
	v1 = a7[2,2]
	@show v1

	a8 = Int64[]

	for i = 1:100
		push!(a8, i) 
	end

	@test sum(a8) == 101*100/2

	a9 = [1, 2, 3]
	@show a9 .+ a9

	# Lets test a matrix-vector product
	@test a9 == a6 * [1, 0, 0]
end

# ╔═╡ 52d6bf41-1023-4f31-9f96-2c8ac264071d
md"""
Congratulations, you have successfully installed and started Julia, and then added the Pluto.jl package and started this notebook from it!
Now we can start!

# Julia Introduction
[Julia](https://julialang.org/) is a relatively new programming language (version 1.0 2018). It was developed specifically for implementing numerical algorithms and is intended to combine the speed of C or Fortran with the ease of use of Python or Matlab. This is achieved by compiling Julia just-in-time (while C or Fortran is compiled before execution, and Python and Matlab are interpreted). 

Furthermore, Julia supports metaprogramming, which is based on ideas from Lisp. In this course we will not deal with metaprogramming due to time constraints, but only with the features we need in the following practical lessons. There will be a special focus on how to actually write "good" programs.

Since we are using Pluto Notebooks for programming in this course, first a brief overview of how they work. You should see a cell here with some numbers in it - click in the cell, and then Shift + Enter! Alternatively, you can use the run button on the right below the cell. There you will also see the time it took to run the cell.
"""

# ╔═╡ 2b11aeee-0826-42cd-822c-94be5861fddb
a = 50 - 5 * 4 + 12

# ╔═╡ 6885dfd4-520e-4d17-b55e-5f31979d6e19
md"""
Here is another cell for you to try out:
"""

# ╔═╡ 8a07e1f7-a0f1-402c-be74-810a47990ced


# ╔═╡ 4289de89-1e43-41ea-8531-337e08b9c031
md"""
To add another cell yourself, the + on the left side above or below the current cell can be used. To hide the input of a cell and only show the output, the eye to the left of the cell can be used - this is how I create these text blocks!
"""

# ╔═╡ 2ba627e9-788a-41fa-9156-2153857c1c32
md"""
Cells can be deleted and deactivated using the three dots at the top right of the cell. Deactivating cells can be particularly useful if the execution of a cell takes a long time, because whenever a part of the notebook is updated, all cells that are affected by this change also run through again. Feel free to try this out with the example below:
"""

# ╔═╡ 0a3a689e-f9c7-4e41-9c7a-074cdf5ee9a0
x = -1

# ╔═╡ 5e57955d-7026-4db2-ae84-c2842e40c7a8
y = 2

# ╔═╡ 08633e97-2de1-492d-aaf4-285beadace83
z = x - y

# ╔═╡ 20fa2f2c-93f6-4a26-8ff7-f7758500d4cc
md"""
If several expressions are to be in the same cell, they must be enclosed in Pluto with a "begin-end" block. Unfortunately, what is not possible in Pluto is to overwrite a variable that has already been used elsewhere. I have already used `a` above, but if I now try to assign a value to `a`, I get an error message, or the cell in which a was previously defined is deactivated in the latest Pluto versions - this is because the automatic updating of all cells would no longer work if `a` were given values in different places!
"""

# ╔═╡ cb249286-96b3-4f4c-9eb9-f5bfef594742
begin
	t = 0
	for i in 1:3
		t += 1
		@show t
	end
end

# ╔═╡ 74ecc059-1f5f-4d82-a534-3a13102fa645
# ╠═╡ disabled = true
#=╠═╡
a = 5
  ╠═╡ =#

# ╔═╡ e499d96e-2f3f-4287-a024-558aa5aefc2a
md"""
# Julia basics
## Types
In Julia, there are all common data types. Of particular interest to us are `Int64` (64-bit large integers) and `Float64` (64-bit large real numbers, i.e. *double precision*). Julia also knows so-called *abstract* data types, such as `Integer`.

!!! tip
	Variables are always written in lower case in Julia. A variable name that is composed of different words is written together. However, if the name of a variable is too long or becomes misleading, underscores can be used to separate the word components.
### Integer
"""

# ╔═╡ f692b4a7-82be-4379-bbaf-7273d8c72e15
begin
	# Integer
	i1 = 1
	@show typeof(i1)
	@show i1 isa Integer
end

# ╔═╡ b54f6a71-ec6c-4194-96b6-d373ecf88f7e
md"""
Julia creates an integer in 64-bit representation by default. To use 16- or 32-bit, the structure of the data type must be used.
"""

# ╔═╡ 483ed423-fcbf-46cc-8bfe-ea3d5b787876
begin
	i2 = 1
	@show typeof(i2)
	i2 = Int32(1)
	@show typeof(i2)
	i2 = Int16(1)
	@show typeof(i2)
end

# ╔═╡ 8a01477f-774c-47a0-81ee-183c8e876f1a
md"""
### Floating point
Floating point numbers work in the same way as integers. What is interesting here is the precision with which a float operation is executed. We can display this with the `eps()` function.
"""

# ╔═╡ 78c8d5a0-72d9-49bd-875f-d87eac11f992
begin
	# Float
	f1 = 1.0
	@show typeof(f1)
	@show f1 isa Float64
	@show eps(f1)
	
	f1 = Float32(1.0)
	@show eps(f1)
	
	f1 = Float16(1.0)
	@show eps(f1)

	f1 = BigFloat(1.0)
	@show eps(f1)
end

# ╔═╡ fe89b668-b3ba-4270-a82a-f4d72e3c514e
md"""
## Structs
Data structures work in Julia like in most other programming languages. One advantage of Julia is that the type of the individual parameters of a data structure can be defined by *parametric types*. The type of the parameter is not defined until the data structure is initialised.
The data type of an element does not necessarily have to be specified. However, this bears the risk of generating slow code, as it increases the probability that the compiler does not know which data type is present. Alternatively, one could specify concrete data types. Often, however, one does not want to do this, as one wants the freedom to choose a more precise/larger but slower data type, or a less precise/smaller but faster data type.

!!! tip
	Data structures are always capitalised in Julia. Individual words are "separated" by *CamelCase* notation

"""

# ╔═╡ 55d46841-bd75-4026-9282-69bc3f8cea9b
struct MixedNumbers{I, F}
	i1::I
	i2::I
	f1::F
	f2::F
	f3::Float32
	f4
end

# ╔═╡ 5d1fd4a7-3711-4b90-83c8-85f1584cd6be
md"""
By using the parametric types `I` and `F` it is only determined that the variables `i1` and `i2` or `f1` and `f2` must have the same type.
"""

# ╔═╡ c3a88e6d-a63d-446d-b111-08a2d2acd48d
begin
	mn = MixedNumbers(1, 2, 1.0, 2.0, 3.0f0, BigFloat(4.0))
	
	@show mn.i1
	@show typeof(mn.i1)
	@show mn.f1
	@show typeof(mn.f1)
	@show typeof(mn.f3)
	@show typeof(mn.f4)
	@show typeof(mn)
end

# ╔═╡ d5c28f40-daa2-4f55-892f-b0b872775900
md"""
## Functions
Similar to data structures, the types of the input parameters of a function can be specified by *parametric types*. This can be used to specify which parameters must be of the same type without specifying which type it must be.

Another useful functionality in Julia is that functions can be overloaded, which means that several functions can be defined with the same name but different input parameters.

!!! tip
	Function names are treated like variable names in Julia.

!!! tip
	Functions that change an input parameter but do not have a return type get an exclamation mark appended.
"""

# ╔═╡ 82a8a074-e849-4578-9621-c6ec129efb0a
function pythagoras(a::F, b::F) where F <: Real
	c = sqrt(a^2 + b^2)
	return c
end

# ╔═╡ 091426b5-a7d1-42e8-bc04-b784f9c9d580
md"""
*Parametric types* are particularly useful for ensuring consistent data types: Usually, you want the arguments of a function to correspond to the return value. What would happen if we used `1.0` instead of `F(1.0)`?
"""

# ╔═╡ 3dad9f90-745b-4b7b-9be1-7d4e0ecca621
function plusone(a::F) where F
	return a + F(1.0)
end

# ╔═╡ ef398c03-f180-44a7-a382-05c4810c515a
begin
	@show plusone(Float32(2.0))
	@show eltype(plusone(Float32(2.0)))
end

# ╔═╡ c5e16094-c2f3-4920-8258-9a13dc3d05cc
md"""
Functions should always be documented. Below you will find an example.
"""

# ╔═╡ 4da88729-e435-48c2-b85c-4d7bf4a0d30d
"""
	add(a, b)

Returns the sum of the values `a` and `b`.
"""
function add(a, b)
	return a + b
end

# ╔═╡ 87b84969-1a5b-4174-92b3-482e8b919892
md"""
## Syntax
### `if`-Statement
In Julia, `if` statement can be created with any number of queries. It is started with an `if` statement and all further statements are appended with `elseif`. An `else` statement is optional and is concluded with an `end`.

The usual logical operators are available

| Operator | Meaning |
| -------- | --------- |
| !x | Negation |
| x && y | and |
| x \|\| y | or |

and the following relational operators:

| Operator | Meaning |
| -------- | --------- |
| x == y | equality |
| x != y | inequality |
| x > y | is greater than |
| x >= y | is greater than or equal to |
| x < y| is smaller than |
| x <= y | is smaller than or equal to |
"""

# ╔═╡ 70c921d7-3482-4cdb-b6ef-b57161b68f8a
begin 
	var1 = 1.0
	if var1 isa Integer
		println("Integer")
	elseif var1 isa Float64
		println("Float")
	else
		println("No Float or Integer")
	end

	if (1.0 > 1.5) || (1.0 < 2.0)
		println(true)
	end

	# This is a neat way to make an if-statement
	# in a single line: if the first statement is true
	# the second statement will be executed
	# There is no problem that the second statement
 	# is not a Boolean
	3 == 3 && println("Hello World")
end

# ╔═╡ dbb6962b-8037-4c7c-9ea4-cee62734946d
md"""
### Arrays, matrices and vectors
In Julia there are the types `Matrix{T}` and `Vector{T}`. Both belong to the superordinate type `Array{T}`. Vectors are one-dimensional arrays and matrices are two-dimensional.

!!! tip
	Arrays should always be pre-allocated if possible and not enlarged in a routine. 
"""

# ╔═╡ fcce5f8b-f885-42d7-a505-7dbabaf3ba10
begin
	# empty arrays
	# Vector
	a1 = zeros(Float64, 5)
	@show typeof(a1)
	# Matrix
	a2 = zeros(Float64, 5, 5)
	@show typeof(a2)
	# Array
	a3 = zeros(Float64, 5, 5, 5)
	@show typeof(a3)
	# Vector, but not initialized
	# If entries overwritten anyhow (without read),
	# then this faster than zeros()
	u1 = Array{Float64}(undef, 5)
	@show typeof(u1)
end

# ╔═╡ 58a3db1f-0f33-4d18-aa6f-3c52f3aa06cf
md"""
## Testing
Above you can already see the `using Test` and the use of the `@test` macro. What happens here is that it checks that a certain expression is `true`. If it is `false` instead, you will get an error. 

!!! tip
	In practice, tests are used to check that all functions in the code do exactly what they are supposed to do. If functions are later changed or extended, you can make sure that the previously existing functionalities have not been changed by mistake by executing all tests.
"""

# ╔═╡ b73f4241-3b19-4a28-ab7b-bb98d61b435f
md"""
## `for- loops
Unlike in Matlab, for example, `for` loops are often the best choice in Julia. In many cases, a `for` loop can be replaced by a matrix-matrix or matrix-vector product. In most cases, this is less readable and not necessarily the faster option in Julia.

#### Examples
```julia

a = [5:10]

# iterating over each element in a
for element in a
	...
end

# iterating over each index of array a
for index in eachindex(a)
	...
end
# equivalent to (can become problematic if startindex is changed)
for index = 1:length(a)
	...
end

# iterating over each element of a, retrieving index and element
for (index, element) in enumerate(a)
	...
end

#iterating over a range
for i = 1:10
	...
end
```
"""

# ╔═╡ 7acc9abe-7091-4265-a157-34643aedffde
md"""
## Unicode support
Julia supports Unicode, all Unicode characters can be used in the code. For example, variable names can be Greek letters, which is very helpful when programming mathematical functions, as variables can have the same name as in the equations. An overview of all supported characters can be found [here](https://docs.julialang.org/en/v1/manual/unicode-input/). 
!!! tip
	You can enter the letters by typing a backslash and the name of the symbol, the Tab key will then convert this into the corresponding symbol.

"""

# ╔═╡ 55d3c082-5053-4c34-b90a-3bca1af0c0b2
md"""
## Problems

!!! warning \"Problem 1.1 Sparse Arrays\"
	Load the library `SparseArrays`.
"""

# ╔═╡ a522f1b0-3539-4f64-ae1f-6ffefcc25bd2
md"""
!!! warning \"Problem 1.2 Sparse Arrays\"
	Create a matrix `A` with 20 rows and 15 columns, where all entries of the matrix should be 0.
	If you call the function `sparse(A)`, your matrix is output as an image, with all entries that are not equal to 0 displayed in black. 
	Now fill the corresponding entries of the matrix with ones so that their first letter appears when you call `sparse(A)`. 
"""

# ╔═╡ b4b38c40-63e3-44f9-ab70-006a6e12fb64
md"""
!!! warning \"Problem 1.3 Initialization of arrays\"
	Create a two-dimensional square array with 10,000 entries, where each element value corresponds to the sum of the column and row index.
	Use the `@test`-macro to randomly test the result. 
"""

# ╔═╡ fcef4cc0-17b5-41c8-85aa-b37863cd3e8a
begin
	A2 = zeros(Int, 100, 100)
	for i in 1:size(A2, 1)
		for j in 1:size(A2, 2)
			A2[i, j] = i + j
		end
	end
	
	@test A2[2, 3] == 5
	@test A2[20, 40] == 60
end

# ╔═╡ 85a9044c-bf81-4905-b863-1d7d441fe007
md"""
!!! warning \"Problem 1.4 Iterative updating\"
	Create a vector with 100 entries, with all values set to zero.
	Set two random values to the value one.
	Now write a function `propagate!()` that receives a vector as an input parameter. The function should update the vector iteratively. In each update, each neighboring element of a one should also be set to the value 1. 
	If all elements of the vector are one, the function should return the number of iterations required.
"""

# ╔═╡ 3e3c98a8-38fb-41f5-9ce4-11eb5f863b87
function propagate!(v::Vector{I}) where I
	vc = copy(v)
	i=0
	while i < 100
		if minimum(v) == 1
			return i
		end
		i += 1
		for i in eachindex(v)
			if vc[i] == 1
				if i > 1 && i < length(v)
					v[i-1] = 1
					v[i+1] = 1
				elseif i == 1
					v[2] = 1
				elseif i == length(v)
					v[end-1] = 1
				end
			end
		end
		vc .= v
	end
	
	if i == 100
		return "failed"
	end
end

# ╔═╡ 0e2e1635-0cf1-4436-ad2d-fcf17ab7e1bf
begin
	v = zeros(Int, 100)
	v[[25, 75]] .= 1
	propagate!(v)
end

# ╔═╡ 11de374f-381e-4e9e-9396-3b3b5068f8cb
md"""
!!! warning \"Problem 1.5 Pythagorean Triples\"
	The numbers a=3, b=4 and c=5 form a Pythagorean triple, which means that a²+b²=c², where a, b and c are integers. There is such a triple where the sum of a, b and c is 1000. This is the one we want to find. Where possible, try to use the concepts introduced so far (for example, use a struct to store your triples).
"""

# ╔═╡ 0cf55708-679b-4bb8-8650-885fcb1a86d2
begin
	struct triplet
		a::Int64
		b::Int64
		c::Int64
	end

	function sumtriplets(x::triplet)
		return x.a + x.b + x.c
	end
	N = 500
	
	triplets = triplet[] # empty vector of type triplet
	
	squares = [i^2 for i in 1:N] # first N square numbers
	for (i,p) in enumerate(squares)
		for (j,q) in enumerate(squares[i:end])
			if (p + q) ∈ squares
				append!(triplets,[triplet(i,i+j-1,findfirst(squares.==p+q))])
			end
		end
	end
end

# ╔═╡ bd7f4f5a-f71f-46fd-bd3e-54f5537a441b
# test if the found triplets are really pythagorean:
begin
		@test sumtriplets(triplet(1,2,3)) == 6
	for i in eachindex(triplets)
		@test triplets[i].a^2+ triplets[i].b^2 == triplets[i].c^2
	end
end

# ╔═╡ 4e9c1f57-9719-442a-8bd4-74b1f65aac74
begin
	# find the triplet with sum 1000
	triplets[findfirst(sumtriplets.(triplets).==1000)]
end


# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
SparseArrays = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"
Test = "8dfed614-e22c-5e08-85e1-65c5234f0b40"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.10.4"
manifest_format = "2.0"
project_hash = "c9c0bb2ff095154d47cfcc3dc6c745795e08806a"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.1.1+0"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "OpenBLAS_jll", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.23+4"

[[deps.Random]]
deps = ["SHA"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.SparseArrays]]
deps = ["Libdl", "LinearAlgebra", "Random", "Serialization", "SuiteSparse_jll"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"
version = "1.10.0"

[[deps.SuiteSparse_jll]]
deps = ["Artifacts", "Libdl", "libblastrampoline_jll"]
uuid = "bea87d4a-7f5b-5778-9afe-8cc45184846c"
version = "7.2.1+1"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.8.0+1"
"""

# ╔═╡ Cell order:
# ╟─52d6bf41-1023-4f31-9f96-2c8ac264071d
# ╠═2b11aeee-0826-42cd-822c-94be5861fddb
# ╟─6885dfd4-520e-4d17-b55e-5f31979d6e19
# ╠═8a07e1f7-a0f1-402c-be74-810a47990ced
# ╟─4289de89-1e43-41ea-8531-337e08b9c031
# ╟─2ba627e9-788a-41fa-9156-2153857c1c32
# ╠═0a3a689e-f9c7-4e41-9c7a-074cdf5ee9a0
# ╠═5e57955d-7026-4db2-ae84-c2842e40c7a8
# ╠═08633e97-2de1-492d-aaf4-285beadace83
# ╟─20fa2f2c-93f6-4a26-8ff7-f7758500d4cc
# ╠═cb249286-96b3-4f4c-9eb9-f5bfef594742
# ╠═74ecc059-1f5f-4d82-a534-3a13102fa645
# ╟─e499d96e-2f3f-4287-a024-558aa5aefc2a
# ╠═f692b4a7-82be-4379-bbaf-7273d8c72e15
# ╟─b54f6a71-ec6c-4194-96b6-d373ecf88f7e
# ╠═483ed423-fcbf-46cc-8bfe-ea3d5b787876
# ╟─8a01477f-774c-47a0-81ee-183c8e876f1a
# ╠═78c8d5a0-72d9-49bd-875f-d87eac11f992
# ╟─fe89b668-b3ba-4270-a82a-f4d72e3c514e
# ╠═55d46841-bd75-4026-9282-69bc3f8cea9b
# ╟─5d1fd4a7-3711-4b90-83c8-85f1584cd6be
# ╠═c3a88e6d-a63d-446d-b111-08a2d2acd48d
# ╟─d5c28f40-daa2-4f55-892f-b0b872775900
# ╠═82a8a074-e849-4578-9621-c6ec129efb0a
# ╟─091426b5-a7d1-42e8-bc04-b784f9c9d580
# ╠═3dad9f90-745b-4b7b-9be1-7d4e0ecca621
# ╠═ef398c03-f180-44a7-a382-05c4810c515a
# ╟─c5e16094-c2f3-4920-8258-9a13dc3d05cc
# ╠═4da88729-e435-48c2-b85c-4d7bf4a0d30d
# ╟─87b84969-1a5b-4174-92b3-482e8b919892
# ╠═70c921d7-3482-4cdb-b6ef-b57161b68f8a
# ╟─dbb6962b-8037-4c7c-9ea4-cee62734946d
# ╠═fcce5f8b-f885-42d7-a505-7dbabaf3ba10
# ╠═e50990fd-30e4-47de-ae83-d4c6e442990f
# ╟─58a3db1f-0f33-4d18-aa6f-3c52f3aa06cf
# ╟─b73f4241-3b19-4a28-ab7b-bb98d61b435f
# ╟─7acc9abe-7091-4265-a157-34643aedffde
# ╟─55d3c082-5053-4c34-b90a-3bca1af0c0b2
# ╠═28e23e08-c8bd-4eb0-a294-71b8788a0349
# ╟─a522f1b0-3539-4f64-ae1f-6ffefcc25bd2
# ╠═c7b437ed-e784-47e9-b555-67f9f19983ff
# ╟─b4b38c40-63e3-44f9-ab70-006a6e12fb64
# ╠═fcef4cc0-17b5-41c8-85aa-b37863cd3e8a
# ╟─85a9044c-bf81-4905-b863-1d7d441fe007
# ╠═3e3c98a8-38fb-41f5-9ce4-11eb5f863b87
# ╠═0e2e1635-0cf1-4436-ad2d-fcf17ab7e1bf
# ╟─11de374f-381e-4e9e-9396-3b3b5068f8cb
# ╠═0cf55708-679b-4bb8-8650-885fcb1a86d2
# ╠═bd7f4f5a-f71f-46fd-bd3e-54f5537a441b
# ╠═4e9c1f57-9719-442a-8bd4-74b1f65aac74
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
