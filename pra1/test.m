% ��������
load prices.mat
load days.mat
N = length(prices);
plot(1:N, prices, 'b');

hold on;

% ���� running_average ����ȥ�����е�����
prices_r = running_average_solution(prices, 30);
plot(1:N, prices_r, 'r');
legend('ԭʼ����','30��ƽ��');
ylabel('���̼�');
xticks(1:738:N);
xticklabels(days(1:738:N, :));
title('��ָ֤������');

grid on;
