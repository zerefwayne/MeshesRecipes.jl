AbstractPlotting.plot(p::Polygon; kwargs...) = plot!(AbstractPlotting.Scene(), p; kwargs...)
AbstractPlotting.plot!(p::Polygon; kwargs...) = plot!(AbstractPlotting.current_scene(), p; kwargs...)
AbstractPlotting.plot!(scene::AbstractPlotting.Scene, p::Polygon; kwargs...) = plot!(scene, p; kwargs...)

import AbstractPlotting: RGBAf0

function AbstractPlotting.plot!(scene::AbstractPlotting.Scene, p::Polygon; fill=true, kwargs...)
  for facet in facets(p)
    plot!(scene, facet)
  end
  pts = coordinates.(vertices(p))
  fill && mesh!(pts, color=RGBAf0(0, 0, 0, 0.6))
  scene
end
