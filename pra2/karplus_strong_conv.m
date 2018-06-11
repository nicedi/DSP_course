function y = karplus_strong_conv(x, h)
    % 在这个函数中你需要实现卷积运算，利用输入信号 x 和 Karplus-Strong 系统的单位冲激响应 h 计算出输出
    % 你需要理解卷积的计算过程
    y = zeros(size(h));  % 由于 Karplus-Strong 系统的单位冲激响应 h 实际是无限长，但本次实验规定了其长度
    % 这个长度已经足够描述输出信号，所以这里令输出信号长度跟 h 一样
    N = length(h);
    for i = 1:N
        s = 0;
        for k = 1:i
            % 代码写在这
        end
        y(i) = s;
    end


end
