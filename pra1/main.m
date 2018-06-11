% 写在 % 号后的是注释。
% 将下列每行语句键入在命令窗口里，然后按回车键会看到结果。

(1 + 4) * 3 % 执行算术运算。运算符：+，-，*，/，^(幂运算)

a = 3; % 定义变量。语句后加分号则结果不回显。


z = 1 + 2*1i; % 定义复数，用1i或1j表示虚数'i'
real(z); % 取出z的实部
imag(z); % 取出z的虚部
abs(z);   % 计算z的模
angle(z); % 计算z的辐角,单位为弧度，介于(-π, π]


v1 = [1 3 5 7 9] % 定义向量
v2 = [2, 4, 6 ,8, 10] % 用空格和逗号隔开元素都行

v3 = v1 - v2 % 参与运算的向量或矩阵维度应该相同。加、减是对应元素的运算
v4 = v1 .* v2 % 如果要进行对应元素的乘除，需要使用点乘或点除运算符。
v5 = v1' % v5是v1的转置，是一个列向量。


b = 0:1:11 % 创建了从0到11步长是1的向量
length(b) % 查看元素个数


b1 = linspace(0, 11, 12) % 另一种创建向量的方法。
help linspace % 查看 linspace 的帮助


b(1) % b的第一个元素
b(2:end) % b从第二到最后所有元素

c = [1 3 6; 2 7 9; 4 3 1] % 创建一个 3X3 的矩阵
size(c) % 查看其维度


c(1, :) % 取出第一行
c(:, 2) % 取出第二列
c(2:3, 1:2) % 取出左下角四个元素（第2到3行，第1到2列）


sum(c) % 按列求和
sum(c, 2) % 按行求和。汇总类函数除了 sum 还有 avg, min, max


sin(c) 
% 对每个元素应用sin函数。其它常用函数还有cos, exp（以e为底的指数）,
% log（自然对数）, log2, abs（绝对值或求模）, angle（求相角）,
% rand（产生均匀分布伪随机数）, randn（产生正态分布伪随机数）,

% 快速创建矩阵
m1 = ones(3, 4) % 创建3X4的全1矩阵
m2 = zeros(3,3) % 全零矩阵
m3 = eye(4) % 单位阵

% 重要常量。eps指数学中的 ε (epsilon)
pi
eps


% 画图
b2 = sin(b * pi / 4);
stem(b, b2)
title('这是一幅火柴杆图') % 添加标题
xlabel('n')
ylabel('sin(n\pi/4)')  % \pi 表示希腊字母 π
legend('正弦信号') % 添加图例


% 画复指数
a = 0 : pi/30 : 2*pi; % [0, 2π]
z = exp(1i * a);
plot(real(z), imag(z), '*'); % 以实部和虚部画点
axis square;
xlabel('Real');
ylabel('Imaginary')


% 保存数据
save data.mat b2; % 保存数据。数据文件扩展名：.mat
load data.mat; % 载入数据


% 程序结构--条件分支
if 2 > 1
    disp('2 > 1') % 输出内容
else
    disp('does not appear') 
end


% 程序结构--循环
s = 0;
for i = 1:5
    s = s + i;
    disp(s);
end

while s > 1
    s = s / 2;
    disp(s);
end


% 作业：
% 在 running_average.m 中实现函数功能，然后在 test.m 中编写代码调用该函数。
% 利用下列代码检验 running_average 函数的正确性。如果输出“函数实现错误”，说明函数实现有误。
t1 = 1:5;
t2 = [1/3 1 2 3 4];
assert(any(running_average(t1,3)-t2) == 0, '函数实现错误')




