function [output] = running_average(input, k)
% �����İ����ĵ�д�ں����������·�
% ����������Ҫ��.m�ļ�������һ��
% ��д��������һ���������ƶ�ƽ����inputΪ����������kΪ����������������output���������
% ��3���ƶ�ƽ��(k=3)Ϊ����output(i) = (input(i) + input(i-1) + input(i-2)) / 3
% ��� i-k С��1��matlab������Ԫ�ص��±��1��ʼ��ǣ�������������������д�0��ʼ��������input(i-k)Ϊ��

% ����input������Ԫ�أ��������������㣺
%    ���㵱ǰ�����֮ǰk-1�������ƽ��ֵ��Ȼ��ֵ��output��Ӧλ�ô�Ԫ�ء�

output = input;

% ����д���·�
for i = 1 : length(input)

    for j = 0 : k-1

        
       
    end

end

end