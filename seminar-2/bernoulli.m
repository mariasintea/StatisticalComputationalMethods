clear all

% Simulate Bernoulli distribution Bern(p)

% the parameter of the Bernoulli distribution
p = input('p (in (0, 1)) = '); 

% Generate one variable
% U = rand; % random number from U(0, 1)
% X = (U < p); % X takes value 1, if U < p and 0, if U >= p

% Generate a sample of N such variables
N = input('nr. of simulations = '); % try different numbers(10, 100, 1e4, 1e5)
X = zeros(1, N); % initialize X
for i = 1 : N
    U = rand;
    X(i) = (U < p); % generate one at a time
end

% Or, if you want to work on matrices
% U = rand(1, N);
% X = (U < p); % generate all at once


% Now to see that X has indeed the desired pdf, we look at the relative frequency of the value 0 
% and of the value 1(those should approximate 1 - p and p, respectively)

% Compare it to the Bern(p) = Bino(1, p) distribution
values = unique(X) % the distinct values of X, no repetitions
nX = histcounts(X, 2); % the frequency of the two distinct values in X
relFreq = nX / N % the relative freq. nX/N approximates the probability