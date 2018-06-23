function z2 = H_s(z,s)
z2 = zeros(size(z));
z2(L_s(z,s)) = z(L_s(z,s));