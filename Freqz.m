function H = Freqz(h, width, name)
    l=0:2*pi/(width-1):2*pi; %set range from 0 to 2*pi
    H=zeros(1,length(l));
    for n=1:length(l)   %width
        for k=0:length(h)-1 %filter's length
            H(n)=H(n)+h(k+1)*exp(-1i*l(n)*k);   
        end
    end
    r = @(x)((abs(x)>1e-10).*x);       %r: check inaccurate value (when x < 1e-10; x = 0)
    magnitude=rr(20*r(log10(abs(H)))); %rr: check very low value (when x < -80 dB; x = NaN)
    
    phase=angle(H)*180/pi; %turn radian to angle
    figure;
    subplot(211);   plot(l/(pi),magnitude);
    title(name);
    xlabel('Frequency (\times\pi rad/sample)'); ylabel('magnitude(dB)');    %show magnitude(db)
    subplot(212);   plot(l/(pi),phase);          grid on; 
    xlabel('Frequency (\times\pi rad/sample)'); ylabel('phase(degrees)');   %show phase(degree)
end

function y = rr(x)    %check very low value (x < -80 dB)
    y = x;
    for i = 1:length(x)
        if x(i) < -80
            y(i) = NaN;
        end
    end
end