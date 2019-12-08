function [y, l]= Conv(h,x,same)
    lx = length(x);
    lh = length(h);
    l = [1:(lx + lh -1)];
    y = zeros(1, length(l));
    for n = 1:length(l)
        for k = 1:length(h)
            if n - k  >= 0
                if (n-k+1) <= length(x)
                    y(n) = y(n) + h(k) .* x(n - k + 1);
                else
                    continue
                end
            else
                break
            end
        end
    end
    if strcmp(same,'same')
        l = 1:lx;
        y = y(1:lx);
    end
end

