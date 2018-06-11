function X = my_dft(x)

    N = length(x);        % 序列长度
    W = exp(-1i*2*pi/N);  % 旋转因子
    X = zeros(size(x));  % 初始化X
    
    for k = 0 : N-1
        % 计算X(k+1)。 注意：Matlab的数组下标从1开始，而DFT的计算式中参数 k 和 n 均从0开始。
        
        
        
        
    end
end