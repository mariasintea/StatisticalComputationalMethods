clear all

% Simulate Poisson distribution P(lambda) by a discrete method

% the lambda parameter of the Poisson distribution
L = input('lambda ( > 0) = ');
% i = 0; % initial value
% F = exp(-L); % initial value of the cdf F(0)
% U = rand;
% while (U >= F) % check that U is in A_i, i. e. F(i - 1) <= U < F(i)
    % the while loop ends when U < F(i)
%    i = i + 1; % count the values in A_i
%    F = F + exp(-L) * L ^ i / factorial(i); % new value of F
% end
% X = i; % the Poisson variable

% Generate a sample of such variables
N = input('nr. of simulations = '); % at least 10000
F = zeros(1, N);
X = zeros(1, N);
for j = 1 : N
    i = 0; % initial value
    F(j) = exp(-L); % initial value of the cdf F(0)
    U = rand;
    while (U >= F(j)) % check that U is in A_i, i. e. F(i - 1) <= U < F(i)
        % the while loop ends when U < F(i)
        i = i + 1; % count the values in A_i
        F(j) = F(j) + exp(-L) * L ^ i / factorial(i); % the new value of F
    end
    X(j) = i; % the Poisson variable
end

% Comparison
fprintf('simulated probab. P(X = 2) = %1.5f\n', mean(X == 2))
fprintf('true probab. P(X = 2) = %1.5f\n', poisspdf(2, L))
fprintf('error = %e\n\n', abs(poisspdf(2, L) - mean(X == 2)))

fprintf('simulated probab. P(X <= 2) = %1.5f\n', mean(X <= 2))
fprintf('true probab. P(X <= 2) = %1.5f\n', poisscdf(2, L))
fprintf('error = %e\n\n', abs(poisscdf(2, L) - mean(X <= 2)))

fprintf('simulated probab. P(X < 2) = %1.5f\n', mean(X < 2))
fprintf('true probab. P(X < 2) = %1.5f\n', poisscdf(1, L))
fprintf('error = %e\n\n', abs(poisscdf(1, L) - mean(X < 2)))

fprintf('simulated mean E(X) = %5.5f\n', mean(X))
fprintf('true mean E(X) = %5.5f\n', L)
fprintf('error = %e\n\n', abs(L - mean(X)))

