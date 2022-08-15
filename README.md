# Out.jl

Out.jl packages the `@out` macro which mimics `@show` but breaking the output in multiple lines for a prettier display (similarly to `display(x)`).

It is specially useful for debugging variables in the REPL: arrays get their variable name displayed together with the size and a pretty output for their values. Still, the printed output is not "copy-paste" ready in the REPL, which is the main reason this was not finally included in `@show`.

## Installation and usage

You can install `Out.jl` in Julia using:
```julia
julia> using Pkg; Pkg.add("Out")
```

And use it in your code with:
```julia
using Out
```

## Examples

Single variable:
```julia
julia> a = [1, 2, 3, 4];
julia> @out a;
a = 4-element Vector{Int64}:
 1
 2
 3
 4
```
Multiple variables:
```julia
julia> a = [1, 2, 3, 4];
julia> b = zeros(4, 4);
julia> @out(a, b);
a = 4-element Vector{Int64}:
 1
 2
 3
 4
b = 4×4 Matrix{Float64}:
 0.0  0.0  0.0  0.0
 0.0  0.0  0.0  0.0
 0.0  0.0  0.0  0.0
 0.0  0.0  0.0  0.0
```
## Acknowledgement and references

The original PR contribution by @matthieugomez can be found [here](https://github.com/JuliaLang/julia/pull/22253).
This topic was further discussed in Julia Discourse [here](https://discourse.julialang.org/t/combining-show-with-display/84522).
