function [y, l]= Conv(h,x)
    lx = length(x);
    lh = length(h);
    l = [1:(lx + lh -1)];
    y = zeros(1, length(l));
    for i = 1:lh
        for j = 1:lx
            y(i+j-1) = h(i) * x(j) + y(i+j-1);
        end
    end
end