function y = matvec1(x,p,d,L) 
if nargin == 3
    S = find(abs(x) > 1/10^10);
    y = zeros(p*d,1);
    for j = S'
        xx = mod(floor((j-1)/p),p) ;
        yy = mod((j-1),p) ;
        for aa = 0:d-1
            bb = mod(yy - aa*xx,p) ;
            i = aa*p + bb + 1 ;
            y(i) = y(i) + x(j) ;
        end
    end
end 
if nargin == 4
    S = intersect(find(abs(x) > 1/10^10),L);
    y = zeros(p*d,1);
    for j = S'
        xx = mod(floor((j-1)/p),p) ;
        yy = mod((j-1),p) ;
        for aa = 0:d-1
            bb = mod(yy - aa*xx,p) ;
            i = aa*p + bb + 1 ;
            y(i) = y(i) + x(j) ;
        end
    end
end 