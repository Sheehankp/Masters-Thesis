function x = matTvec1(y,p,d,L)
if nargin == 3
    S = find(abs(y) > 1/10^13);
    x = zeros(p^2,1);
    for i = S'
        aa = mod(floor((i-1)/p),d);
        bb = mod((i-1),p);
        for xx = 0:p-1
            yy = mod(aa*xx + bb,p);
            j = xx*p + yy + 1;
            x(j) = x(j) + y(i);
        end
    end
end
if  nargin == 4
    S = find(abs(y) > 1/10^13) ;
    x = zeros(p^2,1);
    ell = cell(p,1); Lxx = zeros(p,1);
    for i = 1:length(L)
        xx = mod(floor((L(i)-1)/p),p)+1 ;
        ell{xx} = [ell{xx},mod(L(i)-1,p)] ;
        Lxx(xx) = 1;
    end 
    Lxx = find(Lxx)'-1;
    
    for i = S'
        aa = mod(floor((i-1)/p),d);
        bb = mod(i-1,p);
        for xx = Lxx
            yy = ell{xx+1}(find(ell{xx+1} == mod(aa*xx + bb,p),1));
            if ~isempty(yy)
                j = xx*p + yy + 1 ;
                x(j) = x(j) + y(i) ;
            end 
            clear yy           
        end
    end
end 
