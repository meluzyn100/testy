using Plots

function r(a,e,theta)
    r = a * (1 - e^2)/(1 + e*cos(theta))
end

function circle(x,y,r)
    theta = LinRange(0,2*pi,360)
    return x .+ r*cos.(theta), y .+ r*sin.(theta)
end

a=	1.49598261*10^11 #p
e = 0.01671123
theta = LinRange(0,2*pi,360)

rp = a*(1 - e)
ra = a*(1 + e)

sun = (ra -rp)/2
sr = 6.96340*10^8

allr = r.(a,e,theta)
# scatter(theta,r.(a,e,theta),proj=:polar)
scatter(xlims=(-ra,ra),ylims=(-ra,ra),zlims=(-ra,ra),leg=false,aspect_ratio=:equal)
scatter!([sr],[0],  markersize = 20)
for i in 1:360
    scatter!([allr[i]*cos(theta[i])],[allr[i]*sin(theta[i])],[0])
    plot!()|>display
    sleep(0.01)
end

# plot!(circle(sun,0,sr))
# scatter!([0],[0],  markershape = :hexagon,)
