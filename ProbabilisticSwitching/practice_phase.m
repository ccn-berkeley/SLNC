function trial = practice_phase

global exp

trial = 1;
for rep = 1:2
    % Training trial 1 (choose left; reward)
    init_trial;                                                             % Initialize truth values
    pr_boxes;                                                               % Show boxes and let participant pick one
    drawpict(exp.buffer.coin_left);
    waitkeydown(exp.times.reward);
    exp.reward = 1;
    rec_trial(trial);                                                       % Record trial data and save to file
    update_coin_counter(trial);
    trial = trial + 1;
    % Training trial 2 (choose right; no reward)
    init_trial;                                                             % Initialize truth values
    pr_boxes;                                                               % Show boxes and let participant pick one
    drawpict(exp.buffer.no_coin_right);
    waitkeydown(exp.times.reward);
    exp.reward = 0;
    rec_trial(trial);                                                       % Record trial data and save to file
    update_coin_counter(trial);
    trial = trial + 1;
end
% Training trial 3 (choose right; reward)
for rep = 1:2
    init_trial;                                                             % Initialize truth values
    pr_boxes;                                                               % Show boxes and let participant pick one
    drawpict(exp.buffer.coin_right);
    waitkeydown(exp.times.reward);
    exp.reward = 1;
    rec_trial(trial);                                                       % Record trial data and save to file
    update_coin_counter(trial);
    trial = trial + 1;
end
for rep = 1:2
    % Training trial 4 (choose left; no reward)
    init_trial;                                                             % Initialize truth values
    pr_boxes;                                                               % Show boxes and let participant pick one
    drawpict(exp.buffer.no_coin_left);
    waitkeydown(exp.times.reward);
    exp.reward = 0;
    rec_trial(trial);                                                       % Record trial data and save to file
    update_coin_counter(trial);
    trial = trial + 1;
end

end