
%%%% Anne Collins
%%%% UC Berkeley
%%%% October 2016
%%%% annecollins@berkeley.edu

%%%% Main Script for running tasks


% clear all variables
clear all
clc

%% check that all done well
programs = input('Experimenter: are all other programs turned off? (y/n) :\n','s');
if strmatch(programs,'y')
elseif strmatch(programs,'n')
    disp('Please turn off other programs before re-starting the experiment');
    return
else
    disp('Please answer y or n.');
    return
end

outlet = input('Experimenter: is the laptop plugged into an outlet? (y/n) :\n','s');
if strmatch(outlet,'y')
elseif strmatch(outlet,'n')
    disp('Please plug the laptop into an outlet before re-starting the experiment')
    return
else
    disp('Please answer y or n.');
    return
end

%% set up Working Directory
%WorkingDirectory = 'C:\Users\Main\Documents\MATLAB';
% WorkingDirectory = 'C:\Users\RL\Documents\MATLAB';
% cd(WorkingDirectory)

% get subject, day info
subject_id = input('Enter the subject ID # :\n');


%% implement safeguard

    if exist(['GroupedExpeData/RLWMPST_ID',num2str(subject_id),'.mat'])
        ow = 1;
    else
        ow = 0;
    end
if ow
    disp('!!! CAUTION !!! Data already exists for this subject number.')
    disp('Proceeding to the task may overwrite previous data.')
    disp('Are you sure the numbers were entered correctly?')
    overwrite = input('To proceed, enter (y); to abort, enter (n) :\n','s');


    if strmatch(overwrite,'y')
    elseif strmatch(overwrite,'n')
        disp('Please enter subject # carefully!')
        subject_id = input('Enter the subject ID # :\n');
        return
    else
        disp('Please answer y or n.');
        return
    end

end

%% run expe

demo = 0; 
setDebugState(demo);
runRLWM(subject_id);
disp('End of RLWM. Thank you!')
   
% disp('Running Quality Control')
% getStatsLogistic(subject_id,session,task);