% ����ʵ���������״�˲����˳����������ĸ���

% ��������
load data.mat
% ��ʱ�����������������飬speech���������ݣ�vuvuzela��������������

Fs = 44100; % ����Ƶ��:44.1KHz

% �����������������۲��ź�
soundsc(vuvuzela, Fs);
plot(vuvuzela);
xlabel('n'); ylabel('magnitude');

% �����������۲��ź�
soundsc(speech, Fs);
plot(speech);
xlabel('n'); ylabel('magnitude');

% ���ŵ��Ӻ���������۲��ź�
x = speech + vuvuzela;
soundsc(x, Fs);
plot(x);
xlabel('n'); ylabel('magnitude');


% ���������״�˲��������ڸ��˲����е�����������a,b,k
% 1. ����ȷ��k
% �۲�vuvuzela��Ƶ��
N = length(vuvuzela);
vu_spectrum = abs(fft(vuvuzela));    % ����Ƶ�׵ķ�ֵ���������ǲ�������λ
f = Fs * (0:N-1) / N;                % ��Ƶ��ӳ�䵽ʵ��Ƶ��
plot(f(1:7000),vu_spectrum(1:7000)); % �۲�ֲ�Ƶ��
xlabel('frequency');ylabel('magnitude');

% ���Է�������������Ƶ���ǵȼ���ֲ��ģ�����г���ɷ�
% ���Ƶ��217.15Hz
% ��Ƶ�ʵĹ�һ��Ƶ���ǣ��� = 2��f / fs
Omega = 2 * pi * 217.15 / Fs;

% ��������λԲ�Ϸֲ���������ǣ� k = 2�� / ��
k = fix(2 * pi / Omega);   % ��fix����ȡ��


% 2. ȷ������ a
% ����aӰ�켫���λ�ã�����Ӱ���������
% �������������Ϊ70Hz�����һ��Ƶ�ʣ������ǣ�
B = 2 * pi * 70 / Fs;
% ���ݽ̲ĶԵ����˲�����������ͼʾ�����ǿ��Լ�����������һ�������¼����ģ��Ȼ����ݸ�ֵ����a

% a =    ;



% 3. ȷ������ b
% b =    ;



% �������ǿ���д������״�˲����Ĵ��ݺ�������д����ַ�����
% ��ʵ�ָ��˲�����ַ��̶�Ӧ�ĺ������øú���������������������źţ��۲����������Ƿ���Ч�˳���
clear_x = comb_filter(x, a, b, k);
soundsc(clear_x, Fs);
plot(clear_x);
xlabel('n'); ylabel('magnitude');
