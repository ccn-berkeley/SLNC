function pr_feedback(trial)

global exp

%% Look up which box is the better one
if exp.better_box_left == 1
    better_key = exp.nkey.le;
elseif exp.better_box_left == 0
    better_key = exp.nkey.ri;
end

%% Determine accuracy and present feedback
% When participants gave no response
if isempty(exp.key)
    drawpict(exp.buffer.no_response);
    waitkeydown(2 * exp.times.reward);
% Check if participant pressed an allowed key
elseif exp.key == exp.nkey.le || exp.key == exp.nkey.ri
    % Was the better key pressed? -> Give reward with 75% probability
    if exp.key == better_key && rand < exp.win_prob
        exp.reward = 1;
        if exp.key == exp.nkey.le
            drawpict(exp.buffer.coin_left);
        elseif exp.key == exp.nkey.ri
            drawpict(exp.buffer.coin_right);
        end
        waitkeydown(exp.times.reward);
    % Was the worse key pressed or better key and bad luck (25%)? -> Give no reward
    else
        if exp.key == exp.nkey.le
            drawpict(exp.buffer.no_coin_left);
        elseif exp.key == exp.nkey.ri
            drawpict(exp.buffer.no_coin_right);
        end
        waitkeydown(exp.times.reward);
    end
% When participants pressed wrong key
else
    drawpict(exp.buffer.wrong_key);
    wait(2 * exp.times.reward);
end

end
