function prob_switch

global exp

%% Less than 75% for humans? -> make sure that participants don't switch
% right away, but that they come up with pattern
%% Goal: How do you deal with incidental absence from reward from chance
% versus absence from shift?

%% Define variables here during testing
exp.numb_of_trials.prob_switch = 100 + 4;  % 100 trials take ~4 minutes
exp.subj = round(rand*100);
exp.win_prob = .75;

%% Run the task
init_prob_switch;
set_buffers_and_messages;

%%% Training phase
trial = practice_phase;

%%% Loop through experimental trials
for trial = trial:exp.numb_of_trials.prob_switch
    init_trial;                                                             % Initialize truth values
    
    maybe_switch_sides(trial);                                              % Determine whether sides switch; if so, switch sides
    
    pr_boxes;                                                               % Show boxes and let participant pick one
    pr_feedback(trial);                                                     % Show reward or not
    
    rec_trial(trial);                                                       % Record trial data and save to file
    
    update_coin_counter(trial);
end

%% Say goodbye
%say_goodbye
stop_cogent;
