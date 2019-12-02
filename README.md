# lab-2-LTI-System-Convolution-and-Frequency-Response-t106360107
DSP Lab2 LTI System, Convolution and Frequency Response



## 

### LTI System and Frequency Response: `HW2.m`
此檔案將原始音訊做下列處理：

1. 引入原始音訊 `input.wav`。
2. 設計各系統之脈衝響應 h[n]。
	1. h1 為Ideal Delay之脈衝響應
	2. h2 為Moving Average之脈衝響應
	3. h3 為Accumulator之脈衝響應
	4. h4 為Forward Difference之脈衝響應
	5. h5 為Backward Difference之脈衝響應
3. 引用 `Freqz.m` 顯示各系統之頻率響應 H(e^jw)。
4. 引用 `Conv.m` 將原始訊號通過各系統並將輸出結果顯示其波形及頻譜。
5. 將輸出之訊號寫入檔案
	1. `y1.wav` 為Ideal Delay之輸出音訊檔案
	2. `y2.wav` 為Moving Average之輸出音訊檔案
	3. `y3.wav` 為Accumulator之輸出音訊檔案
	4. `y4.wav` 為Forward Difference之輸出音訊檔案
	5. `y5.wav` 為Backward Difference之輸出音訊檔案

### 各系統之頻率響應以及輸出波形與頻譜圖

#### Input Signal
![alt_text](https://github.com/t106360107/DSPlab2/blob/master/plot/Original Signal.png)

#### Ideal Delay
![alt_text](https://github.com/t106360107/DSPlab2/blob/master/plot/Delay_freqz.png)
![alt_text](https://github.com/t106360107/DSPlab2/blob/master/plot/Delay_conv.png)

#### Moving Average
![alt_text](https://github.com/t106360107/DSPlab2/blob/master/plot/MovingAverage_freqz.png)
![alt_text](https://github.com/t106360107/DSPlab2/blob/master/plot/MovingAverage_conv.png)

#### Accumulator
![alt_text](https://github.com/t106360107/DSPlab2/blob/master/plot/Accumulator_freqz.png)
![alt_text](https://github.com/t106360107/DSPlab2/blob/master/plot/Accumulator_conv.png)

#### Forward Difference
![alt_text](https://github.com/t106360107/DSPlab2/blob/master/plot/Forward_freqz.png)
![alt_text](https://github.com/t106360107/DSPlab2/blob/master/plot/Forward_conv.png)

#### Backward Difference
![alt_text](https://github.com/t106360107/DSPlab2/blob/master/plot/Backward_freqz.png)
![alt_text](https://github.com/t106360107/DSPlab2/blob/master/plot/Backward_conv.png)

### 自定義 Convolution function: `Conv.m`
此檔案為自定義之Convolution function。
function [y, l]= Conv(h,x)
y 回傳 h 及 x 摺機後之結果
l 回傳摺機後之長度

### 自定義 Frequency response function: `Freqz.m`
此檔案為自定義之Frequency response function並顯示頻率響應之結果。
function H = Freqz(h, width, name)
H 回傳 h 之頻率響應並依照width決定點的數量。
name 為顯示結果之title。


### PPT project `HW2.pptx`
PPT報告將此LTI System的處理過程較為詳盡的說明展示，並附上各個過程的波形、頻譜及音源。
