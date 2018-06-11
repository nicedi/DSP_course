% 载入数据
load prices.mat
load days.mat
N = length(prices);
plot(1:N, prices, 'b');

hold on;

% 调用 running_average 函数去除其中的噪声
prices_r = running_average_solution(prices, 30);
plot(1:N, prices_r, 'r');
legend('原始数据','30日平均');
ylabel('收盘价');
xticks(1:738:N);
xticklabels(days(1:738:N, :));
title('上证指数走势');

grid on;
