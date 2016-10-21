function prob_switch

global exp

%% Set variables (for testing only)
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
%% run_length same for all participants on one day
%% Also color-code boxes? Would help memory?
%% Make it engaging enough so that Ss don't pick randomly (keep track of
% score?)
%% "There is one good box and one bad box - try to find as much gold as you can!"
%% Start with deterministic - move on to probabilistic
%% Goal: How do you deal with incidental absence from reward from chance
% versus absence from shift?
%% "There is not always a coin - but there is always a good box"

%% Prerandomize: sequences 00, 11, 01 
%% 10 different pre-randomzied sequences for everybody

%% add start time and end time & date

exp.numb_of_trials.prob_switch = 25;
exp.subj = round(rand*100);
% Determine how many rewards long each run will be (run = time during which
% one box is the better box; number of reward per run = uniform 7-23)
exp.run_length = randsample(5:15, 50, true);
exp.win_prob = .75;

%% Run the task
init_prob_switch;
set_buffers_and_messages;

%%% Give task instructions
pr_instruction;
drawpict(exp.buffer.fixation);                                              % Fixation screen
wait(500);

%%% Loop through trials
for trial = 1:exp.numb_of_trials.prob_switch
    init_trial(trial);                                                      % Initialize truth values
    
    maybe_switch_sides(trial);                                              % Determine whether sides switch; if so, switch sides
    
    pr_boxes(trial);                                                        % Show boxes and let participant pick one
    pr_feedback(trial);                                                     % Show reward or not
    
    rec_trial(trial);                                                       % Record trial data and save to file
    
    update_coin_counter(trial);
end

%% Say goodbye
%say_goodbye
stop_cogent;
