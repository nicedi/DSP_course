% 本次项目我们分析一个有关太阳黑子数量的真实数据，从中发现太阳活动的周期。
% sunspot.csv 文件来自网站 http://www.sidc.be/silso/datafiles
% 该文件记录了从1749年1月到2017年4月的太阳黑子月度观测数据
% 首先我们读入该文件数据并观察

data = csvread('sunspot.csv');

% 该数据由七列组成，我们只关注第3列：小数表示的年月，和第4列：月度平均太阳黑子数量
% 其它列的含义参见 http://www.sidc.be/silso/infossntotmonthly
time = data(:, 3);
sunspot = data(:, 4);

% 画图进行观察
plot(time, sunspot); % 以时间为横轴，太阳黑子数量为纵轴
xlim([1749 2017]); % 限定时间范围
xlabel('年');
ylabel('太阳黑子数量');
title('太阳黑子月度观测数据');
% 是不是观察到明显的周期性呢？那么太阳的活动周期到底是多少年呢？


% 首先来实现DFT的计算
% 完成my_dft函数中的代码，实现DFT的计算
% 与Matlab内置的fft函数计算结果对比无误后再进行后续分析
test_x = 0:7;
assert(sum(abs(my_dft(test_x) - fft(test_x))) < 0.001, 'DFT函数实现有误');


% 接下来进行DFT分析
% 先施加窗函数。这里用汉宁窗，你还可以尝试其它窗函数
N = 1024;    % 样点数。大约近100年的数据
sunspot_w = hann(N) .* sunspot(length(sunspot)-N+1 : end);
% 计算频谱：
spectrum = my_dft(sunspot_w);

% 可以发现直接用DFT的定义式进行计算是比较费时的，因此需要更快的算法。
% 快速傅里叶变换（Fast Fourier Transform, FFT）是一种计算DFT的快速算法。
% Matlab中的函数fft即采用此算法，本课程不讨论FFT的实现过程。


% 将DFT的频点与归一化频率对应起来
% 只观察[0, pi)区间
Omega = linspace(0, pi, N/2);

plot(Omega, abs(spectrum(1 : N/2)), '-o', 'LineWidth', 2);
xlim([0 pi]);
xlabel('归一化频率')
ylabel('幅值');
title('太阳黑子月度观测数据幅频特性');


% 频谱图显示该信号有直流成分（信号均值）
% 和一个比较显著的交流成分，可以初步断定该交流成分就是太阳的活动周期
% 对频谱幅值降序排序
[sorted_spectrum, idx] = sort(abs(spectrum(1 : N/2)), 'descend');
% 上述 sort 函数的用法及返回参数的含义请看Matlab帮助


% 求出幅值第3大的频点（幅值最大的是直流成分，第3大的频点是一个显著的交流成分）对应的归一化频率
Omg = Omega(idx(3));
disp(['太阳活动归一化频率：', num2str(Omg)])


% 计算太阳活动的实际频率
% 因为归一化频率 Ω = 2πf/fs , 其中f是实际信号频率，fs是采样频率
% 在本实验中 fs = 1，其值含义是一月一次
% 所以 f = Ωfs / 2π , 经计算（Omg * fs / 2 / pi） f = 0.0075 （单位：次/月）
% 即太阳活动的周期  T = 1/f = 133（月） 约为 11.1（年）

