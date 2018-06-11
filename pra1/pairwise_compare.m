function out = pairwise_compare(in1, in2)
% 把两个序列对应位置处较大的元素挑出来放在输出序列中

    assert(length(in1) == length(in2), '输入序列长度不同');
    
    out = zeros(size(in1));
    
    for i = 1:length(in1)  
        if in1(i) > in2(i)
            % 代码写在这;
        else
            % 代码写在这;
        end
    end
    
end