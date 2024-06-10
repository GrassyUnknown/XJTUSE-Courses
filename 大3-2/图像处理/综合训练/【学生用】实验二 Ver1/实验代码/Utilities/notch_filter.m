function [H_NF] = notch_filter(I,v_k,u_k)
[P, Q] = size(I);
for u = 1:P
     for v = 1:Q
        % D的取值影响陷波的范围
        D = 10;  
        
        D_k1 = ((u-P/2-u_k)^2 + (v-Q/2-v_k)^2)^(0.5);
        D_k2 = ((u-P/2+u_k)^2 + (v-Q/2+v_k)^2)^(0.5);
        H_NF(u,v) = 1/(1+(D/D_k1)^4) * 1/(1+(D/D_k2)^4);
     end
end