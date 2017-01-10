function [ output ] = IsRightAns( x )
%ISRIGHTANS Summary of this function goes here
%   判断x是否为正确解：0：错解； -1：不完全解； 1：正确解
for i = 1:9
    for j = 1:9
        if isempty(x{i,j})
            output = 0; %错误结果
            return;
        end
    end
end

for i = 1:9
    for j = 1:9
        if length(x{i,j}) > 1
            output = -1; %还存在未知解，需进一步迭代
            return;
        end
    end
end

output = 1; %正确解

end

