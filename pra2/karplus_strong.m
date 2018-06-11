function y = karplus_strong(x, L, N)
    % Karplus-Strong �㷨��Karplus Strong Algorithm�������������Ϊ��Alexander Strong ����������㷨,
	% �� Kevin Karplus ���������Ĺ���ԭ��.
    % ����һ�𿪷�����Ӧ����Ӳ�����������㷨����Ϊ "Digitar", �� "digital guitar" ֮��.

    % ���㷨�ɱ�ʾΪ��
    % y(i) = [y(i-L) + y(i-L-1)]/2 + x(i)
    % ����x(i)�������źţ�y(i)������źţ�L���ӳ�
    % ���źźϳ���һ���޶�����źŵĳ���ΪN

    % N �������1
    if N < 1 || N ~= fix(N)
        error('����źų���Ӧ�ô���1��Ϊ������');
    end

    % ��ʼ������ź�
    y = zeros(1, N);

    % ��������źŵ�����ֵ
    for i = 1 : N
        if i-L < 1
            y1 = 0;  % y1 ָ y(i-L) ����
        else
            y1 = y(i-L);
        end
        if i-L-1 < 1
            y2 = 0;  % y2 ָ y(i-L-1) ����
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
