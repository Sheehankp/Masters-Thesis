% - Much larger parameters are likely to be chosen in applications.

%% G^[1]
clear, clc

tic
p = 47 ;
d = 11 ;
s = 100 ;

x = s_sparse(p^2,s,100,-50) ;
y = matvec1(x,p,d) ;

C = (d*p)/(s * log(p^2/s))
theta = 1 - nnz(y)/(s*d) 


xSharpIHT = IHT1(y,p,d,s) ;
xSharpHTP = HTP1(y,p,d,s) ;
xSharpOMP = OMP1(y,p,d) ;
xSharpCoSaMP = CoSaMP1(y,p,d,s) ;

norm(x - xSharpIHT)
norm(x - xSharpHTP)
norm(x - xSharpOMP)
norm(x - xSharpCoSaMP)
toc





%% G^[2]
clear, clc

tic
p = 13 ;
d = 4 ;
s = 100 ;

x = s_sparse(p^3,s,100,-50) ;
y = matvec2(x,p,d) ;


C = (d*p^2)/(s * log(p^3/s))
theta = 1 - nnz(y)/(s*d) 


xSharpIHT = IHT2(y,p,d,s) ;
xSharpHTP = HTP2(y,p,d,s) ;
xSharpOMP = OMP2(y,p,d) ;
xSharpCoSaMP = CoSaMP2(y,p,d,s) ;


norm(x - xSharpIHT)
norm(x - xSharpHTP)
norm(x - xSharpOMP)
norm(x - xSharpCoSaMP)
toc



%% G^[3]
clear, clc

tic
p = 7 ;
d = 4 ;
s = 100 ;

x = s_sparse(p^4,s,100,-50) ;
y = matvec3(x,p,d) ;


C = (d*p^3)/(s * log(p^4/s))
theta = 1 - nnz(y)/(s*d) 


xSharpIHT = IHT3(y,p,d,s) ;
xSharpHTP = HTP3(y,p,d,s) ;
xSharpOMP = OMP3(y,p,d) ;
xSharpCoSaMP = CoSaMP3(y,p,d,s) ;


norm(x - xSharpIHT)
norm(x - xSharpHTP)
norm(x - xSharpOMP)
norm(x - xSharpCoSaMP)
toc




