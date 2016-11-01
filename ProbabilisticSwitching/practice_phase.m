function trial = practice_phase

%%% Phase 1: Left box = good; chose left, left, right, left, right;
trial = 1;
%"Try to collect as many magic coins as you can!"
%"The magic coins are hidden in two boxes."
%"Let's see if the left box has the magic coin!"
%"Can you open the left box? (left arrow key)"
update_coin_counter(trial)
choose_left_box_get_reward(trial);
trial = trial + 1;
%"Hurray, the left box had a magic coin!"
%"The left box seems to be the magic box!"
%"Let's check if the left box has another coin!"
%"Can you open the left box again?"
choose_left_box_get_reward(trial);
trial = trial + 1;
%"Hurray, the left box had another magic coin!"
%"The left box must be the magic box!"
%"Let's now look into the right box!"
%"Can you open the right box? (right arrow key)?"
choose_right_box_no_reward(trial);
trial = trial + 1;
%"The right box had no magic coin..."
%"The right box is not the magic box..."
%"Let's see if the left box has more coins!"
%"Can you open the left box?"
choose_left_box_get_reward(trial);
trial = trial + 1;
%"Hurray, the left box had another coin!"
%"The left box is magical!"
%"Let's look into the right box again."
choose_right_box_no_reward(trial);
trial = trial + 1;
%"The right box still has no coins..."
%"The right box is not magical..."

%%% Phase 2: Right box = good; chose right, left, left, right;
%"You are pretty good at finding magical coins already!"
%"Put pay attention!"
%"Sometimes, the magical box switches sides!"
%"Maybe it has switched sides now!"
%"Let's check this. Can you open to right box to see if it has a coin?"
choose_right_box_get_reward(trial);
trial = trial + 1;
%"Hurray, the right box had a coin!"
%"The right box must be the magical box!"
%"What is inside the left box now?"
%"Can you open the left box?"
choose_left_box_no_reward(trial);
trial = trial + 1;
%"The left box had no coin..."
%"It is not the magical box any more..."
%"Let's try the left box again!"
choose_left_box_no_reward(trial);
trial = trial + 1;
%"The left box had no coin..."
%"It is not the magical box any more..."
%"Let's try to get another coin now!"
%"Which box is magical box? Which box should we pick?"
choose_right_box_get_reward(trial);
trial = trial + 1;
%"Hurray, the right box is the magical box and had another coin!"

%%% Phase 3: Introduce stochasticity; right box = good; choose right, right, left, right, right
%"The magical box is always one of the two boxes."
%"But sometimes, even the magical box has no magical coin!"
%"Let's see if the magical right box has a coin this time!"
choose_right_box_no_reward(trial);
trial = trial + 1;
%"Oh no, the magical right box had no magical coin this time!"
%"Let's try again!"
choose_right_box_get_reward(trial);
trial = trial + 1;
%"Hurray, the magical right box had a coin this time!"
%"Let's check the left box now."
choose_left_box_no_reward(trial);
trial = trial + 1;
%"The left box had no coin."
%"Let's check the right box again!"
choose_right_box_get_reward(trial);
trial = trial + 1;
%"Hurray, the right box had a coin!"
%"Let's try again!
choose_right_box_no_reward(trial);
trial = trial + 1;
%"Oh no, the magical right box had no magical coin this time!"
%"Let's try again!"
choose_right_box_get_reward(trial);
trial = trial + 1;
%"Hurray, the right box had a coin!"

%"Remember, try to find as many magical coins as you can!"
%"Magical coins are only hidden in the magical box!"
%"Sometimes, the magical box switches sides!"
%"Even the magical box does not always have a coin!"

end