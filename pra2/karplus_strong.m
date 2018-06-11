function y = karplus_strong(x, L, N)
    % Karplus-Strong 算法（Karplus Strong Algorithm）如此命名是因为：Alexander Strong 发明了这个算法,
	% 而 Kevin Karplus 分析了它的工作原理.
    % 他们一起开发了相应的软硬件，并将该算法命名为 "Digitar", 即 "digital guitar" 之意.

    % 该算法可表示为：
    % y(i) = [y(i-L) + y(i-L-1)]/2 + x(i)
    % 其中x(i)是输入信号，y(i)是输出信号，L是延迟
    % 在信号合成中一般限定输出信号的长度为N

    % N 必须大于1
    if N < 1 || N ~= fix(N)
        error('输出信号长度应该大于1且为整数。');
    end

    % 初始化输出信号
    y = zeros(1, N);

    % 计算输出信号的其它值
    for i = 1 : N
        if i-L < 1
            y1 = 0;  % y1 指 y(i-L) 部分
        else
            y1 = y(i-L);
        end
        if i-L-1 < 1
            y2 = 0;  % y2 指 y(i-L-1) 部分
        else
            y2 = y(i-L-1);
        end
        if i > length(x)
            x1 = 0;
        else
            x1 = x(i);
        end
        y(i) = (y1 + y2)/2 + x1;

    end
end
