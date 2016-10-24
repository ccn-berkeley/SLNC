function update_coin_counter(trial)

global exp

%% Add running coin count
set_buffers_and_messages;
earned_coins = nansum(exp.PROBSWITCHdata.reward);
for buffer = 1:exp.numb_of_buffers
    loadpict('stimuli/coin_small.png', buffer, 300, 300);
    preparestring(num2str(earned_coins), buffer, 340, 300);
end

%% Wait ITI
drawpict(exp.buffer.fixation);                                                                % Fixation screen
wait(exp.times.iti(trial));

end