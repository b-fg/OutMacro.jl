module Out

"""
    out(exs...)

Pretty print for a variable(s) using `display`-like output and a `@show`-like header.
"""
macro out(exs...)
    blk = Expr(:block)
    for ex in exs
        push!(blk.args, :(print($(sprint(Base.show_unquoted, ex) * " = "))))
        push!(blk.args, :(show(stdout, "text/plain", begin value=$(esc(ex)) end)))
        push!(blk.args, :(println()))
    end
    isempty(exs) || push!(blk.args, :value)
    return blk
end

export @out

end
