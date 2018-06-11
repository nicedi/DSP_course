% ������Ŀ���Ƿ���һ���й�̫��������������ʵ���ݣ����з���̫��������ڡ�
% sunspot.csv �ļ�������վ http://www.sidc.be/silso/datafiles
% ���ļ���¼�˴�1749��1�µ�2017��4�µ�̫�������¶ȹ۲�����
% �������Ƕ�����ļ����ݲ��۲�

data = csvread('sunspot.csv');

% ��������������ɣ�����ֻ��ע��3�У�С����ʾ�����£��͵�4�У��¶�ƽ��̫����������
% �����еĺ���μ� http://www.sidc.be/silso/infossntotmonthly
time = data(:, 3);
sunspot = data(:, 4);

% ��ͼ���й۲�
plot(time, sunspot); % ��ʱ��Ϊ���ᣬ̫����������Ϊ����
xlim([1749 2017]); % �޶�ʱ�䷶Χ
xlabel('��');
ylabel('̫����������');
title('̫�������¶ȹ۲�����');
% �ǲ��ǹ۲쵽���Ե��������أ���ô̫���Ļ���ڵ����Ƕ������أ�


% ������ʵ��DFT�ļ���
% ���my_dft�����еĴ��룬ʵ��DFT�ļ���
% ��Matlab���õ�fft�����������Ա�������ٽ��к�������
test_x = 0:7;
assert(sum(abs(my_dft(test_x) - fft(test_x))) < 0.001, 'DFT����ʵ������');


% ����������DFT����
% ��ʩ�Ӵ������������ú��������㻹���Գ�������������
N = 1024;    % ����������Լ��100�������
sunspot_w = hann(N) .* sunspot(length(sunspot)-N+1 : end);
% ����Ƶ�ף�
spectrum = my_dft(sunspot_w);

% ���Է���ֱ����DFT�Ķ���ʽ���м����ǱȽϷ�ʱ�ģ������Ҫ������㷨��
% ���ٸ���Ҷ�任��Fast Fourier Transform, FFT����һ�ּ���DFT�Ŀ����㷨��
% Matlab�еĺ���fft�����ô��㷨�����γ̲�����FFT��ʵ�ֹ��̡�


% ��DFT��Ƶ�����һ��Ƶ�ʶ�Ӧ����
% ֻ�۲�[0, pi)����
Omega = linspace(0, pi, N/2);

plot(Omega, abs(spectrum(1 : N/2)), '-o', 'LineWidth', 2);
xlim([0 pi]);
xlabel('��һ��Ƶ��')
ylabel('��ֵ');
title('̫�������¶ȹ۲����ݷ�Ƶ����');


% Ƶ��ͼ��ʾ���ź���ֱ���ɷ֣��źž�ֵ��
% ��һ���Ƚ������Ľ����ɷ֣����Գ����϶��ý����ɷ־���̫���Ļ����
% ��Ƶ�׷�ֵ��������
[sorted_spectrum, idx] = sort(abs(spectrum(1 : N/2)), 'descend');
% ���� sort �������÷������ز����ĺ����뿴Matlab����


% �����ֵ��3���Ƶ�㣨��ֵ������ֱ���ɷ֣���3���Ƶ����һ�������Ľ����ɷ֣���Ӧ�Ĺ�һ��Ƶ��
Omg = Omega(idx(3));
disp(['̫�����һ��Ƶ�ʣ�', num2str(Omg)])


% ����̫�����ʵ��Ƶ��
% ��Ϊ��һ��Ƶ�� �� = 2��f/fs , ����f��ʵ���ź�Ƶ�ʣ�fs�ǲ���Ƶ��
% �ڱ�ʵ���� fs = 1����ֵ������һ��һ��
% ���� f = ��fs / 2�� , �����㣨Omg * fs / 2 / pi�� f = 0.0075 ����λ����/�£�
% ��̫���������  T = 1/f = 133���£� ԼΪ 11.1���꣩
