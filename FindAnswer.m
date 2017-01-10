function [ Rtn ] = FindAnswer( clues, NumberBox, s_comfirmed, iterate_deep, try_cont )
%FINDANSWER Summary of this function goes here
% 迭代主程序：使用已知线索推测新线索，当没有新线索的时候，则推测出可能的线索，并继续迭代，
% 直到得到最终解
% Rtn = -1:Unconfirmed ans, need continue this iteraton; 
% Rtn = 0:Error ans,jump out this iteration and goto next iteration; 
% Rtn = 1:Right ans,jump out this iteration and goto next iteration; 
% Rtn = 2:Enough ans',iteration cancled by user, all iteration stop;
global g_answer
global g_interate_deep
global g_try_cont
global g_try_fail_temp
global g_try_total_temp
global g_try_fail
global g_try_total
global g_ans_cont_max
global g_current_cont
global g_h_waitbar
iterate_deep = iterate_deep + 1;
[NumberBox1, s_comfirmed1] = ClueToBox(clues, NumberBox, s_comfirmed);
Rtn = IsRightAns(NumberBox1);
if Rtn == 1
    g_current_cont = g_current_cont + 1;
    g_answer{g_current_cont} = cell2mat(NumberBox1);
    g_interate_deep(g_current_cont) = iterate_deep;
    g_try_cont(g_current_cont) = try_cont;
    g_try_fail(g_current_cont) = g_try_fail_temp;
    g_try_total(g_current_cont) = g_try_total_temp;
    waitbar(g_current_cont/g_ans_cont_max,g_h_waitbar,[int2str(g_current_cont) '/' int2str(g_ans_cont_max)]);
    if g_current_cont == g_ans_cont_max
        Rtn = 2;
    end
    return;
end
if Rtn == 0
    g_try_fail_temp = g_try_fail_temp + 1;
    return;
end

clues1 = GetNewClues(NumberBox1, s_comfirmed1);
if ~isempty(clues1)
    Rtn = FindAnswer( clues1, NumberBox1, s_comfirmed1, iterate_deep, try_cont );
    return;
end
    
if isempty(clues1)
    try_cont = try_cont + 1;
    [r,c,GuessList] = GuessAns(NumberBox1,s_comfirmed1);
    for i = 1:length(GuessList)
        g_try_total_temp = g_try_total_temp + 1;
        clues1 = [r,c,GuessList(i)];
        Rtn = FindAnswer( clues1, NumberBox1, s_comfirmed1, iterate_deep, try_cont );
        if Rtn == 2
            break;
        end
    end
    return;
end
    
end

