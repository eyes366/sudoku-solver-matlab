function [ clues1 ] = GetNewClues( NumberBox1, s_comfirmed1 )
%GETNEWCLUES Summary of this function goes here
%   寻找新线索
%   当格子只存在一个数字的时候则为所谓的新线索
clues1 = [];
for i = 1:9
    for j = 1:9
        if s_comfirmed1(i,j) == 1
            continue;
        end
        if length(NumberBox1{i,j}) == 1
            clues1 = [clues1; [i,j,NumberBox1{i,j}]];
        end
    end
end
hist33 = cell(3,3);
for i = 1:3
    for j = 1:3
        hist33{i,j} = zeros(3,9);
    end
end
hist_h = cell(1,9);
for i = 1:9
    hist_h{i} = zeros(3,9);
end
hist_v = cell(1,9);
for i = 1:9
    hist_v{i} = zeros(3,9);
end
for i = 1:9
    for j = 1:9
        if s_comfirmed1(i,j) == 1
            continue;
        end
        ii = floor((i-1)/3) + 1;
        jj = floor((j-1)/3) + 1;
        for k = 1:length(NumberBox1{i,j})
            temp = NumberBox1{i,j}(k);
            hist33{ii,jj}(1,temp) = hist33{ii,jj}(1,temp) + 1;
            hist33{ii,jj}(2,temp) = i;
            hist33{ii,jj}(3,temp) = j;
            hist_h{i}(1,temp) = hist_h{i}(1,temp) + 1;
            hist_h{i}(2,temp) = i;
            hist_h{i}(3,temp) = j;
            hist_v{j}(1,temp) = hist_v{j}(1,temp) + 1;
            hist_v{j}(2,temp) = i;
            hist_v{j}(3,temp) = j;
        end
    end
end

for i = 1:3
    for j = 1:3
        for k = 1:9
            if hist33{i,j}(1,k) == 1
                clues1 = [clues1; [hist33{i,j}(2,k),hist33{i,j}(3,k),k]];
            end
        end
    end
end

for i = 1:9
    for k = 1:9
        if hist_h{i}(1,k) == 1
            clues1 = [clues1; [hist_h{i}(2,k),hist_h{i}(3,k),k]];
        end
        if hist_v{i}(1,k) == 1
            clues1 = [clues1; [hist_v{i}(2,k),hist_v{i}(3,k),k]];
        end
    end
end

clues1 = unique(clues1,'rows');

end

