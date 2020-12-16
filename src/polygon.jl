AbstractPlotting.plot(p::Polygon; kwargs...) = plot!(AbstractPlotting.Scene(), p; kwargs...)
AbstractPlotting.plot!(p::Polygon; kwargs...) = plot!(AbstractPlotting.current_scene(), p; kwargs...)
AbstractPlotting.plot!(scene::AbstractPlotting.Scene, p::Polygon; kwargs...) = plot!(scene, p; kwargs...)

function AbstractPlotting.plot!(scene::AbstractPlotting.Scene, p::Polygon; kwargs...)
  for facet in facets(p)
    plot!(scene, facet)
  end
  scene
end


