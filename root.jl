### A Pluto.jl notebook ###
# v0.19.40

using Markdown
using InteractiveUtils

# ╔═╡ 6521fe79-fe73-4932-9348-527117d6f62c
function bisection_method(f, a, b; tol=1e-4, max_iter=100)
    # Check if initial interval [a, b] is valid
    if f(a) * f(b) > 0
        error("The function must have different signs at a and b")
    end
    
    iter = 0
    while (b - a) / 2 > tol && iter < max_iter
        c = (a + b) / 2  # Midpoint
        if f(c) == 0      # Found exact root
            return c
        elseif f(a) * f(c) < 0
            b = c         # Root is in the left half
        else
            a = c         # Root is in the right half
        end
        iter += 1
    end
    
    return (a + b) / 2  # Approximate root after loop ends
end


# ╔═╡ 66ed77b8-8fa9-44cf-aeb7-8b94873d58e6
function regula_falsi(f,a,b;tol=1e-4,max_iter=100)
	#check if interval is valid
		if f(a)*f(b)>0
			error("the function myst have different signs at a and b ")
		end
	iter=0
	while iter<max_iter
		c=(a*f(b)-b*f(a))/(f(b)-f(a))
		if abs(f(c))<tol
			return c 
		elseif f(a)*f(c)<0
			b=c
		else 
			a=c
		end
		iter+=1
	end
	return c
end
	
		

# ╔═╡ d74254f1-4123-483c-b6f9-f2d97064c7c6
function secant(f,a,b;tol=1e-4,max_iter=100)
	iter=0
	while iter<max_iter
		c=(a*f(b)-b*f(a))/(f(b)-f(a))
		if abs(f(c))<tol
			return c 
		else
			a=b
			b=c
		end 
		iter+=1
	end
	return c
end

# ╔═╡ 7342e4d5-7ae9-4f93-bb74-bb6d17f7f55b
begin
f(x) = x^3 - x - 1

root = secant(f, 1, 2)
println("The root is approximately $root")
end

# ╔═╡ 85a761e2-7336-44f3-8bea-384571d0a10e


# ╔═╡ Cell order:
# ╠═6521fe79-fe73-4932-9348-527117d6f62c
# ╠═66ed77b8-8fa9-44cf-aeb7-8b94873d58e6
# ╠═7342e4d5-7ae9-4f93-bb74-bb6d17f7f55b
# ╠═d74254f1-4123-483c-b6f9-f2d97064c7c6
# ╠═85a761e2-7336-44f3-8bea-384571d0a10e
