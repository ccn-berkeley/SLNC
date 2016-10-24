function prob_switch

global exp

%% Less than 75% for humans? -> make sure that participants don't switch
% right away, but that they come up with pattern
%% Initial training: 100% reward - one side; make run lengths shorter
% progressively; introduce stochasticity
%% Might have to tell them about the task (one side will be better than the
% other; this side will switch - instead of pretraining; don't tell reward
% probability) Or pre-training (Alison suggests)
%% 15+-7.5 (variation same as block length; they need some unrewarded
% experience in each block)
%% How many trials / blocks? Beta coefficient of switch_stay ~ reward:
% Beta reward was bigger than beta unrewarded
%% (((After switch, reward probability = 100% for opposite side)))
%% Goal: How do you deal with incidental absence from reward from chance
% versus absence from shift?
%% "There is one good box and one bad box - try to find as much gold as you can!"
%% "There is not always a coin - but there is always a good box"

%% Define variables here during testing
exp.numb_of_trials.prob_switch = 100 + 4;  % 100 trials take ~4 minutes
exp.subj = round(rand*100);
exp.win_prob = .75;

%% Run the task
init_prob_switch;
set_buffers_and_messages;

%%% Training phase
last_train_trial = practice_phase;

%%% Loop through experimental trials
for trial = last_train_trial:exp.numb_of_trials.prob_switch
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
