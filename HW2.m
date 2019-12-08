clear all; close all;

[x, fs] = audioread('input.wav');
x = x';

t = [0:1:(length(x)-1)]/fs; 

figure;
subplot(211); plot(t, x);
title('Original Signal');
xlabel('Time (s)'); ylabel('Magnitude');
subplot(212); specgram(x, 256, fs);


%filters--------------------------------------
nd = 2;                                  %Delay time(sec)
M = 20;                                  %moving window
h1 = zeros(1,nd * fs);  h1(end+1) = 1;   %Ideal Delay
h2 = ones(1,M)/M;                        %Moving Average
h3 = ones(1,length(x));                  %Accumulator
h4 = [1 -1 0];                           %Forward Difference
h5 = [0 1 -1];                           %Backward Difference

%frequency response
Freqz(h1, 512, 'Ideal Delay nd = 2');
Freqz(h2, 512, 'Moving Average M = 20');
Freqz(h3, 512, 'Accumulator');
Freqz(h4, 512, 'Forward Difference');
Freqz(h5, 512, 'Backward Difference');

%LTI system------------------------------------
[y1, l1] = Conv(h1,x,'valid');              %Ideal Delay
[y2, l2] = Conv(h2,x,'valid');              %Moving Average
[y3, l3] = Conv(h3,x, 'same');              %Accumulator
[y4, l4] = Conv(h4,x,'valid');              %Forward Difference
[y5, l5] = Conv(h5,x,'valid');              %Backward Difference


%the signal after LTI system------------------
figure;                             %Ideal Delay
subplot(211); plot(l1/fs, y1);
title(num2str(nd,'Ideal Delay nd = %d'));
xlabel('Time (s)'); ylabel('Magnitude');
subplot(212); specgram(y1, 256, fs);

figure;                             %Moving Average
subplot(211); plot(l2/fs, y2);
title(num2str(M, 'Moving Average M = %2d'));
xlabel('Time (s)'); ylabel('Magnitude');
subplot(212); specgram(y2, 256, fs);

figure;                             %Accumulator
subplot(211); plot(l3/fs, y3);
title('Accumulator');
xlabel('Time (s)'); ylabel('Magnitude');
subplot(212); specgram(y3, 256, fs);

figure;                             %Forward Difference
subplot(211); plot(l4/fs, y4);
title('Forward Difference');
xlabel('Time (s)'); ylabel('Magnitude');
subplot(212); specgram(y4, 256, fs);

figure;                             %Backward Difference
subplot(211); plot(l5/fs, y5);
title('Backward Difference');
xlabel('Time (s)'); ylabel('Magnitude');
subplot(212); specgram(y5, 256, fs);

%audiowrite---------------------------------
audiowrite('y1.wav', y1, fs);           %Ideal Delay
audiowrite('y2.wav', y2, fs);           %Moving Average
audiowrite('y3.wav', y3, fs);           %Accumulator
audiowrite('y4.wav', y4, fs);           %Forward Difference
audiowrite('y5.wav', y5, fs);           %Backward Difference    
%{
input('press any key to play input sound');
sound(x, fs);
input('press any key to play the delay sound');
sound(y1, fs);
input('press any key to play the averaged sound');
sound(y2, fs);
input('press any key to play the accumulator sound');
sound(y3, fs);
input('press any key to play the forward difference sound');
sound(y4, fs);
input('press any key to play the backward difference sound');
sound(y5, fs);

%}