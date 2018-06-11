% 0. 本次实验首先利用 karplus_strong 算法合成吉他的音色，然后对该声音合成系统进行分析
% 1. 阅读 karplus_strong_conv.m 文件中的注释，然后在提示编程的地方编写代码实现该函数的功能
% 2. 阅读下面的注释并理解代码
% 3. 完成一个差分方程所描述系统的分析


% 调用 karplus_strong 函数，听听合成出的声音有没有吉他的音色
x = randn(1, 100); % x 是正态分布随机数
N = 48000; % 输出样点数
L = 50;    % 延迟
y = karplus_strong(x, L, N); % 产生输出
Fs = 48000; % 采样率
soundsc(y, Fs); % 将信号当作声音来播放
plot(y);  % 观察信号

% 获得系统单位冲激响应
h = karplus_strong(ones(1), L, N);
stem(h(1:400)); % 观察单位冲激响应

% 实现 karplus_strong_conv 函数
% 检验计算结果与实际结果的差异
y2 = karplus_strong_conv(x,h);
assert(sum(abs(y - y2)) < 1e-6, '卷积计算结果与实际结果差异过大');

% MATLAB自带卷积计算函数，下面和我们实现的卷积比较一下计算效率
y3 = conv(x, h);
% 可以发现，上述代码的执行效率很高。你觉得该在哪些方面优化你的卷积实现代码。

%  频域分析
%  对 y(i) = 0.5*(y(i-L) + y(i-L-1)) + x(i) 进行z变换，写出传递函数表达式
%  H(z) = 1 / (1 - 0.5*(z^(-L) + z^(-L-1)))
%  绘出幅频特性和相频特性
omega = linspace(0, pi, 1000); % omega 即归一化频率，令其在0到pi上取值
H = 1 ./ (1 - 0.5*(exp(-1j * L * omega) + exp(-1j * (L+1) * omega))); % 计算频率响应
subplot(211)
plot(omega, abs(H)); % 画幅频特性
title('幅频特性');
subplot(212)
plot(omega, angle(H)); % 画相频特性
title('相频特性');

% 为什么会有这样的特性曲线呢？我们接下来观察该系统的零极点


% 零极点分析
% 以 L=10 为例
% 此时 H(z) = z^11 / (z^11 - 0.5z - 0.5)
% 即 H 在原点有11个零点
zero_points = [0 0 0 0 0 0 0 0 0 0 0]';

% 还有11个极点可以这样确定
% 利用 roots 函数求多项式方程：z^11 - 0.5z - 0.5 = 0 的根
% roots 里的向量是多项式：z^11 - 0.5z - 0.5 的向量化表示
pole_points = roots([1 0 0 0 0 0 0 0 0 0 -0.5 -0.5]); % roots里的向量是H(z)分母多项式的向量化表示
% 画零极点图
figure();
zplane(zero_points, pole_points);

% 从极点的分布规律可以理解为什么该系统有如此频率特性。
