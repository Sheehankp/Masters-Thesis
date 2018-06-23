function x = s_sparse(N,s,m,b)
if nargin < 4
    b = 0;
    if nargin < 3
        m = 1;
    end 
end 
x = zeros(N,1);
x(randsample(N,s)) = rand(1,s)*m+b;