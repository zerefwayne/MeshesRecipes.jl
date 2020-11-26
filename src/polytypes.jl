function default_theme(scene::SceneLike, ::Type{<: Plot(Polytope)})
    Theme(
        color = :red,
        strokewidth = 3
    )
end

"""
    Function to plot all types which are type Meshes.Polytype
"""
function AbstractPlotting.plot!(plot::Plot(Polytope))
    pt = to_value(plot[1])
    v = coordinates.(vertices(pt))
    poly!(plot, v, color = :transparent, strokecolor = plot[:color], strokewidth = plot[:strokewidth])
    scatter!(plot, v, color = plot[:color])
    plot
end
