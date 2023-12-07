%Simulate Markov chain in Problem 5, seminar 4
clear all
Nm = input('lenght of a sample path (of Markov chain) = ');
X = zeros(1, Nm); % allocate memory for X
P0 = [0.2 0.8]; % initial distribution of sunny/rainy
P = [0.7 0.3; 0.4 0.6]; % trans. prob matrix
P1(1, :) = P0; % P1 will contain forecast at each step
                % first row contains the forecast in day t = 1

for t = 1: Nm
    U = rand;
    X(t) = 1 * (U < P0(1)) + 2 * (U >= P0(1));
    % simulate X(1)...X(Nm) sequentially, as Bernoulli variables taking
    % value 1 with prob. P0(1) and value 2 with prob. 1 - P0(1)
    P1(t + 1, :) = P1(t, :) * P; % forecast for the next day
    P0 = P(X(t), :); % prepare the distribution of X(t+1); its pdf is the
                     % its pdf is the X(t)th row of matrix P
end
X

i_change = [find(X(1: end - 1) ~= X(2: end)), Nm] % indexes where states change
longstr(1) = i_change(1) % first long streak ends at the first change

for i =  2: length(i_change)
    longstr(i) = i_change(i) - i_change(i - 1) % the remaining long streak 
                                       % are diferences between any two changes
end

if (X(1) == 1) % the first day is sunny
    sunny = longstr(1:2:end); % long streaks of sunny
    rainy = longstr(2:2:end); % long streaks of rainy
else
    sunny = longstr(2:2:end); % long streaks of sunny
    rainy = longstr(1:2:end); % long streaks of rainy
end

maxs = max(sunny) % longest streak of sunny days
maxr = max(rainy) % longest streak of rainy days
