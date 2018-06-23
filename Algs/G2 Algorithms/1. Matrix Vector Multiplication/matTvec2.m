function x = matTvec2(y,p,d,L)
if nargin == 3
    S = find(abs(y) > 1/10^10);
    x = zeros(p^3,1);
    for i = S'
        aa = mod(floor((i-1)/(p^2)),p);
        bb = mod(floor((i-1)/p),p);
        cc = mod(i-1,p);
        for xx = 0:p-1
            yy = mod(aa*xx + bb,p);
            zz = mod(aa*yy + cc,p);
            j = xx*p^2 + yy*p + zz + 1;
            x(j) = x(j) + y(i) ;
        end
    end
end 
if nargin == 4
    ell_y = cell(p,1); ell_z = cell(p,p); Lxx = zeros(p,p);
    for i = 1:length(L)
        xx = mod(floor((L(i)-1)/(p^2)),p)+1 ;
        ell_y{xx} = [ell_y{xx},mod(floor((L(i)-1)/p),p)] ;
        ell_z{xx, (ell_y{xx}(end)+1) } = [ell_z{xx, (ell_y{xx}(end)+1) },mod(floor(L(i)-1),p)] ;
        Lxx(xx) = 1;
    end 
    Lxx = find(Lxx)'-1;
    
    S = find(abs(y) > 1/10^10);
    x = zeros(p^3,1);
    for i = S'
        aa = mod(floor((i-1)/(p^2)),p) ;
        bb = mod(floor((i-1)/p),p);
        cc = mod(i-1,p);
        for xx = Lxx
            yy = ell_y{xx+1}(find(ell_y{xx+1} == mod(aa*xx + bb,p),1)) ;
            if ~isempty(yy)
                zz = ell_z{xx+1,yy+1}(find(ell_z{xx+1,yy+1} == mod(aa*yy + cc,p),1));
                if ~isempty(zz) 
                    j = xx*p^2 + yy*p + zz + 1 ;
                    x(j) = x(j) + y(i) ;
                end
            end
            clear yy zz
        end
    end
end 
