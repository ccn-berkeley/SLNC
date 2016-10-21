function pr_instruction

global exp;

%% Write messages
m11 = 'In this game, try to find as many coins as you can!';
m12 = 'The coins will be hidden in two boxes:';
m13 = 'Pick one box to see if it has a coin!';

%% slide 1
clearkeys;
clearpict(exp.buffer.text)
preparestring(m11, exp.buffer.text, 0, 250);
preparestring(m12, exp.buffer.text, 0, 200);
loadpict('stimuli/box.png', exp.buffer.text, -exp.p.box_x, exp.p.box_y);
loadpict('stimuli/box.png', exp.buffer.text, exp.p.box_x, exp.p.box_y);
drawpict(exp.buffer.text)
waitkeydown(inf, 71);
preparestring(m13, exp.buffer.text, 0, -250);
drawpict(exp.buffer.text)
waitkeydown(inf, 71);
clearpict(exp.buffer.text)

end