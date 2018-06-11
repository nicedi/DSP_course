function [output] = running_average(input, k)
% 函数的帮助文档写在函数声明正下方
% 函数的名字要和.m文件的名字一样
% 编写函数计算一个向量的移动平均，input为输入向量，k为参与计算的样点数，output是输出向量
% 以3点移动平均(k=3)为例，output(i) = (input(i) + input(i-1) + input(i-2)) / 3
% 如果 i-k 小于1（matlab中向量元素的下标从1开始标记，而不像其它编程语言中从0开始），则令input(i-k)为零

% 对于input的所有元素，依次做如下运算：
%    计算当前样点和之前k-1个样点的平均值，然后赋值给output对应位置处元素。

output = input;

% 代码写在下方
for i = 1 : length(input)

    for j = 0 : k-1

        
       
    end

end

end