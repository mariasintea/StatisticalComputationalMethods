clear all

% Simulate Binomial distribution Bino(n, p)

% read the parameters of the Bino distribution
n = input('n (in N) = ');
p = input('p (in (0, 1)) = ');

% Generate one variable
% U = rand(n, 1);
% X = sum(U < p);

% Generate a sample of such variables
N = input('nr. of simulations = ');
X = zeros(1, N); % initialize X
for i = 1 : N 
    U = rand(n, 1);
    X(i) = sum(U < p); % generate one variable at a time
end

% Or, if you want to work on matrices
% U = rand(n, N);
% X = (U < p); % sum is computed on each column

% To see how good the simulation is, we could either compare the graphs(of
% the true Binomial distribution and the simulated one) or compare various
% probabilities.

% Comparison
fprintf('simulated probab. P(X = 2) = %1.5f\n', mean(X == 2))
fprintf('true probab. P(X = 2) = %1.5f\n', binopdf(2, n, p))
fprintf('error = %e\n\n', abs(binopdf(2, n, p) - mean(X == 2)))

fprintf('simulated probab. P(X <= 2) = %1.5f\n', mean(X <= 2))
fprintf('true probab. P(X <= 2) = %1.5f\n', binocdf(2, n, p))
fprintf('error = %e\n\n', abs(binocdf(2, n, p) - mean(X <= 2)))

fprintf('simulated probab. P(X < 2) = %1.5f\n', mean(X < 2))
fprintf('true probab. P(X < 2) = %1.5f\n', binocdf(1, n, p))
fprintf('error = %e\n\n', abs(binocdf(1, n, p) - mean(X < 2)))

fprintf('simulated mean E(X) = %5.5f\n', mean(X))
fprintf('true mean E(X) = %5.5f\n', n * p)
fprintf('error = %e\n\n', abs(n * p - mean(X)))