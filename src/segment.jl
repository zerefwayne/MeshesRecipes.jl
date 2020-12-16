AbstractPlotting.plot(s::Segment; kwargs...) = plot!(AbstractPlotting.Scene(), s; kwargs...)
AbstractPlotting.plot!(s::Segment; kwargs...) = plot!(AbstractPlotting.current_scene(), s; kwargs...)
AbstractPlotting.plot!(scene::AbstractPlotting.Scene, s::Segment; kwargs...) = plot!(scene, s; kwargs...)

function AbstractPlotting.plot!(scene::AbstractPlotting.Scene, s::Segment; kwargs...)
  v = coordinates.(vertices(s))
  lines!(scene, v, kwargs...)
  scatter!(scene, v, kwargs...)
  scene
end
