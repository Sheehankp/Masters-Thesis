function y = matvec3(x,p,d,L)
if nargin == 3
    S = find(abs(x) > 1/10^10);
    y = zeros(p^3*d,1);
    for j = S'
        xx = mod(floor((j-1)/(p^3)),p) ;
        yy = mod(floor((j-1)/(p^2)),p) ;
        zz = mod(floor((j-1)/p),p) ;
        ww = mod(j-1,p) ;
        for aa = 0:d-1
            bb = mod(yy - aa*xx,p) ;
            cc = mod(zz - aa*yy,p) ;
            dd = mod(ww - aa*zz,p) ;
            i = aa*p^3 + bb*p^2 + cc*p + dd + 1 ;
            y(i) = y(i) + x(j) ;
        end
    end
end 
if nargin == 4
    S = intersect(find(abs(x) > 1/10^10),L);
    y = zeros(p^3*d,1);
    for j = S'     
        xx = mod(floor((j-1)/(p^3)),p) ;
        yy = mod(floor((j-1)/(p^2)),p) ;
        zz = mod(floor((j-1)/p),p) ;
        ww = mod(j-1,p) ;
        for aa = 0:d-1
            bb = mod(yy - aa*xx,p) ;
            cc = mod(zz - aa*yy,p) ;
            dd = mod(ww - aa*zz,p) ;
            i = aa*p^3 + bb*p^2 + cc*p + dd + 1 ;
            y(i) = y(i) + x(j) ;
        end
    end
end 

