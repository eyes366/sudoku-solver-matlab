function [ output ] = IsRightAns( x )
%ISRIGHTANS Summary of this function goes here
%   �ж�x�Ƿ�Ϊ��ȷ�⣺0����⣻ -1������ȫ�⣻ 1����ȷ��
for i = 1:9
    for j = 1:9
        if isempty(x{i,j})
            output = 0; %������
            return;
        end
    end
end

for i = 1:9
    for j = 1:9
        if length(x{i,j}) > 1
            output = -1; %������δ֪�⣬���һ������
            return;
        end
    end
end

output = 1; %��ȷ��

end

