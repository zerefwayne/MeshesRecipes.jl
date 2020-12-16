AbstractPlotting.plot(p::Polyhedron; kwargs...) = plot!(AbstractPlotting.Scene(), p; kwargs...)
AbstractPlotting.plot!(p::Polyhedron; kwargs...) = plot!(AbstractPlotting.current_scene(), p; kwargs...)
AbstractPlotting.plot!(scene::AbstractPlotting.Scene, p::Polyhedron; kwargs...) = plot!(scene, p; kwargs...)

function AbstractPlotting.plot!(scene::AbstractPlotting.Scene, p::Polyhedron; kwargs...)
  for facet in facets(p)
    plot!(scene, facet)
  end
  scene
end
