function out = pairwise_compare(in1, in2)
% ���������ж�Ӧλ�ô��ϴ��Ԫ���������������������

    assert(length(in1) == length(in2), '�������г��Ȳ�ͬ');
    
    out = zeros(size(in1));
    
    for i = 1:length(in1)  
        if in1(i) > in2(i)
            % ����д����;
        else
            % ����д����;
        end
    end
    
end