% 本次实验需设计梳状滤波器滤除呜呜祖拉的干扰

% 载入数据
load data.mat
% 此时工作区中有两个数组，speech是人声数据，vuvuzela是呜呜祖拉数据

Fs = 44100; % 采样频率:44.1KHz

% 播放呜呜祖拉，并观察信号
soundsc(vuvuzela, Fs);
plot(vuvuzela);
xlabel('n'); ylabel('magnitude');

% 播放人声并观察信号
soundsc(speech, Fs);
plot(speech);
xlabel('n'); ylabel('magnitude');

% 播放叠加后的声音并观察信号
x = speech + vuvuzela;
soundsc(x, Fs);
plot(x);
xlabel('n'); ylabel('magnitude');


% 下面设计梳状滤波器，对于该滤波器中的三个参数：a,b,k
% 1. 首先确定k
% 观察vuvuzela的频谱
N = length(vuvuzela);
vu_spectrum = abs(fft(vuvuzela));    % 计算频谱的幅值，这里我们不关心相位
f = Fs * (0:N-1) / N;                % 把频点映射到实际频率
plot(f(1:7000),vu_spectrum(1:7000)); % 观察局部频谱
xlabel('frequency');ylabel('magnitude');

% 可以发现呜呜祖拉的频谱是等间隔分布的，即有谐波成分
% 其基频是217.15Hz
% 该频率的归一化频率是：Ω = 2πf / fs
Omega = 2 * pi * 217.15 / Fs;

% 则整个单位圆上分布的零点数是： k = 2π / Ω
k = fix(2 * pi / Omega);   % 用fix函数取整


% 2. 确定参数 a
% 参数a影响极点的位置，进而影响阻带带宽。
% 这里令阻带带宽为70Hz，则归一化频率（带宽）是：
B = 2 * pi * 70 / Fs;
% 根据教材对点阻滤波器阻带带宽的图示，我们可以计算在上述归一化带宽下极点的模，然后根据该值计算a

% a =    ;



% 3. 确定参数 b
% b =    ;



% 现在我们可以写出此梳状滤波器的传递函数进而写出差分方程了
% 请实现该滤波器差分方程对应的函数，用该函数处理混有呜呜祖拉的信号，观察呜呜祖拉是否被有效滤除。
clear_x = comb_filter(x, a, b, k);
soundsc(clear_x, Fs);
plot(clear_x);
xlabel('n'); ylabel('magnitude');
