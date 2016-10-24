function create_sequence_randomizations

% Determine how many rewards long each run will be (run = time during which
% one box is the better box; number of reward per run = uniform 7-23)
for sequence = 0:9
    run_length = randsample(5:15, 50, true);
    run_length(1) = run_length(1) + 4;  % Participants got 4 coins during training, which don't count toward length of first run
    save(sprintf('Prerandomized sequences/run_length%i.mat', sequence), 'run_length');
end