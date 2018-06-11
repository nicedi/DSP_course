%% 本次项目需要你设计一个FIR低通滤波器， 然后用该滤波器滤除一个信号中的高频噪声
fs = 1000; % 采样频率是1000Hz
T = 1/fs; % 采样周期是0.001s。1e-3是采用科学计数法表示的0.001
N = 50; % 样点数

% 构造离散信号
f0 = 100; % 信号频率100Hz
n = 0:N-1;
my_signal = sin(2*pi*f0*n*T);

my_noise = 0.6 * sin(2*pi*400*n*T); % 噪声频率是400Hz
my_polluted_signal = my_signal + my_noise; % 将噪声叠加到信号上
stem(n, my_polluted_signal); % 观察被噪声污染的信号


% 计算FIR滤波器的单位冲激响应
M = 20; % 截取的长度
fc = 200; % 低通滤波器截止频率是200Hz
wc = 2 * pi * fc / fs; % 归一化截止频率
% 计算 a_0 和 a_n
a0 = wc / pi;
an = zeros(1, M);
for i = 1:M
    an(i) = wc * sin(i*wc) / pi / (i*wc);
end
% 拼出完整的单位冲激响应
h = [fliplr(an), a0, an];

% 观察汉宁窗函数
m = 0:(2*M);
w_hann = 0.5 - 0.5*cos(2*pi*m/(2*M));
stem(m, w_hann);

% 对 h 施加汉宁窗函数
h_s = h .* w_hann;

% 进行滤波
my_filted_signal = conv(my_polluted_signal, h_s); % 利用卷积运算得到输出信号

% 对比观察被污染的信号，经过滤波后的信号和原信号
subplot(311);
stem(n, my_polluted_signal);
title('含噪声的信号');

subplot(312);
stem(n, my_filted_signal(1:N));
title('经过滤的信号');

subplot(313);
stem(n, my_signal);
title('原始信号');
