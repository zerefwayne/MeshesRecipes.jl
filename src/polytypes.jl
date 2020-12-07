function default_theme(scene::SceneLike, ::Type{<:Plot(Polytope)})
    Theme(
        color = :black,
        strokewidth = 2
    )
end

using Meshes

"""
    Function to plot all types which are type Meshes.Polytype
"""
function AbstractPlotting.plot!(plot::Plot(Polytope))
    pt = to_value(plot[1])
    # convert StaticArray to Array
    v = coordinates.(vertices(pt))
    scatter!(plot, v, color = plot[:color])
    # push first element to create complete the polygon
    # [(1, 0), (0, 0), (0, 1)] -> [(1, 0), (0, 0), (0, 1), (1, 0)]
    v = Array.(v)
    push!(v, v[1])
    # extract x indices
    xs = ((x) -> x[1]).(v)
    # extract y indices
    ys = ((x) -> x[2]).(v)
    if embeddim(pt) == 2
        lines!(plot, xs, ys)
    elseif embeddim(pt) == 3
        # if third dimension exists, extract z indices
        zs = ((x) -> x[3]).(v)
        lines!(plot, xs, ys, zs)
    end
    plot
end
