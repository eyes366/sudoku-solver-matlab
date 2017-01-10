function [ NumberBox1, s_comfirmed1 ] = ClueToBox( clues, NumberBox, s_comfirmed )
%CLUETOBOX Summary of this function goes here
%   使用已知的线索来缩小每个格子的可能性范围
[r,c] = size(clues);
for i = 1:r
    x = clues(i,1); xx = floor((x-1)/3)+1;
    y = clues(i,2); yy = floor((y-1)/3)+1;
    z = clues(i,3); 
    for j = 1:9
        NumberBox{x,j}(NumberBox{x,j}==z) = [];
        NumberBox{j,y}(NumberBox{j,y}==z) = [];
    end
    for j = (xx-1)*3+1:(xx-1)*3+3
        for k = (yy-1)*3+1:(yy-1)*3+3
            NumberBox{j,k}(NumberBox{j,k}==z) = [];
        end
    end
    NumberBox{x,y} = z;
    s_comfirmed(x,y) = 1;
end

NumberBox1 = NumberBox;
s_comfirmed1 = s_comfirmed;

end

