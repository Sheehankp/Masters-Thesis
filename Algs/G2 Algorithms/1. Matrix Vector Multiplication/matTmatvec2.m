function z = matTmatvec2(x,p,d,L)
S = find(abs(x) > 1/10^10)';
LS = intersect(L,S);
z1 = zeros(length(L),1);
for j1 = 1:length(L)-1
     xx1 = mod(floor((L(j1)-1)/(p^2)),p);
     yy1 = mod(floor((L(j1)-1)/p),p);
     zz1 = mod(L(j1)-1,p);
    for j2 = j1+1:length(L)
        xx2 = mod(floor((L(j2)-1)/(p^2)),p);
        yy2 = mod(floor((L(j2)-1)/p),p);
        zz2 = mod(L(j2)-1,p);
        for aa = 0:d-1
            if ((mod(yy1 - aa*xx1,p) == mod(yy2 - aa*xx2,p))) && ((mod(zz1 - aa*yy1,p) == mod(zz2 - aa*yy2,p))) 
                  z1(j1) = z1(j1) + x(L(j2)) ;
                  z1(j2) = z1(j2) + x(L(j1)) ;
            end 
        end 
    end 
end
for i = 1:length(LS)
    z1(LS(i) == L) = z1(LS(i) == L) + d*x(LS(i)) ;
end 
z = zeros(p^3,1);
z(L) = z1;