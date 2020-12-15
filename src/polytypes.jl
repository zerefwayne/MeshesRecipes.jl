function default_theme(scene::SceneLike, ::Type{<:Plot(Polytope)})
    Theme(
        color = :black,
        strokewidth = 2
    )
end

"""
    Function to plot all types which are type Meshes.Polytope
"""
function AbstractPlotting.plot!(plot::Plot(Polytope))
    pt = to_value(plot[1])
    v = coordinates.(vertices(pt))
    scatter!(plot, v, color = plot[:color])
    edges = facets(pt)
    for edge in edges
        v = edge.vertices
        vc = coordinates.(v)
        lines!(plot, vc)
    end
    plot
end
