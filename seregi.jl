#by Borys Kopeć, 23.03.2020

using Plots

MODE = 0 # 0 - sequence, 1(anything else than 0) - series
X_MIN = 0 # = a where x ϵ [a, b]
X_MAX = 1 # = b where x ϵ [a, b]
N_LIMIT = 10 # maximum n(iterations), ususally 10 will be enough to see how function behaves
PRECISION = (X_MAX - X_MIN) * 21 # precision of the x axis(set by default to (X_MAX - X_MIN) * 21)

fn(n::Int, x::Real) = x * (1 - x) ^ n / n # fₙ(x) = ...

xs = LinRange(X_MIN, X_MAX, PRECISION)
ns = 1:N_LIMIT
gn = fn.(ns, xs')

plot()
if MODE == 0
    for n in ns
        plot!(xs, gn[n, :], legend = nothing) |> display
    end
    else
    sn = zeros(N_LIMIT, PRECISION)
    for i in 1:PRECISION
        sn[:, i] = cumsum(gn[:, i])
    end
    for n in ns
        plot!(xs, sn[n, :], legend = nothing) |> display
    end
end


