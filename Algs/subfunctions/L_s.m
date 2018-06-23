function  S = L_s(z,s)
S = [];
z = abs(z) ;
while length(S) < s
    a = max(z) ;
    I = find(a == z)';
    S = [S,I] ;
    if length(S) > s
        S(s+1:length(S)) = [];
    end 
    z(I) = -Inf;
    I = [];
end 
