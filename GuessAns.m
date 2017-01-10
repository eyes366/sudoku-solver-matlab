function [ r,c,GuessList ] = GuessAns( NumberBox1, s_comfirmed1 )
%GUESSANS Summary of this function goes here
%   当没有新线索的时候，使用当前信息推测出可能的线索，为迭代提供猜测的线索
NumCont = zeros(9,9);
for i = 1:9
    for j = 1:9
        NumCont(i,j) = length(NumberBox1{i,j});
    end
end
NumCont(logical(s_comfirmed1)) = 10;
[r,c] = find(NumCont==min(NumCont(:)));
r = r(1); c = c(1);
GuessList = NumberBox1{r,c};
GuessList = GuessList(randperm(length(GuessList)));

end

