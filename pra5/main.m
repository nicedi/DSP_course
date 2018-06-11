%% ������Ŀ��Ҫ�����һ��FIR��ͨ�˲����� Ȼ���ø��˲����˳�һ���ź��еĸ�Ƶ����
fs = 1000; % ����Ƶ����1000Hz
T = 1/fs; % ����������0.001s��1e-3�ǲ��ÿ�ѧ��������ʾ��0.001
N = 50; % ������

% ������ɢ�ź�
f0 = 100; % �ź�Ƶ��100Hz
n = 0:N-1;
my_signal = sin(2*pi*f0*n*T);

my_noise = 0.6 * sin(2*pi*400*n*T); % ����Ƶ����400Hz
my_polluted_signal = my_signal + my_noise; % ���������ӵ��ź���
stem(n, my_polluted_signal); % �۲챻������Ⱦ���ź�


% ����FIR�˲����ĵ�λ�弤��Ӧ
M = 20; % ��ȡ�ĳ���
fc = 200; % ��ͨ�˲�����ֹƵ����200Hz
wc = 2 * pi * fc / fs; % ��һ����ֹƵ��
% ���� a_0 �� a_n
a0 = wc / pi;
an = zeros(1, M);
for i = 1:M
    an(i) = wc * sin(i*wc) / pi / (i*wc);
end
% ƴ�������ĵ�λ�弤��Ӧ
h = [fliplr(an), a0, an];

% �۲캺��������
m = 0:(2*M);
w_hann = 0.5 - 0.5*cos(2*pi*m/(2*M));
stem(m, w_hann);

% �� h ʩ�Ӻ���������
h_s = h .* w_hann;

% �����˲�
my_filted_signal = conv(my_polluted_signal, h_s); % ���þ������õ�����ź�

% �Աȹ۲챻��Ⱦ���źţ������˲�����źź�ԭ�ź�
subplot(311);
stem(n, my_polluted_signal);
title('���������ź�');

subplot(312);
stem(n, my_filted_signal(1:N));
title('�����˵��ź�');

subplot(313);
stem(n, my_signal);
title('ԭʼ�ź�');
