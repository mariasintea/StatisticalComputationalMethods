clear all

% Simulate Geometric distribution Geo(p) by a discrete method

% the parameter of the geometric distribution
p = input('p (in (0, 1)) = ');

% We count that number of failures until the first success
% X = 0; % initial number of failures
% while rand >= p % 'rand < p' represents success so 'rand >= p' represents failure
%     X = X + 1; % increase the number of failures
% end % stop at the first success

% Genereate a sample of such variables
N = input('nr. of simulations = '); % at least 10000
X = zeros(1, N);
for i = 1 : N
    while rand >= p
        X(i) = X(i) + 1;
    end
end

% Comparison
fprintf('simulated probab. P(X = 2) = %1.5f\n', mean(X == 2))
fprintf('true probab. P(X = 2) = %1.5f\n', geopdf(2, p))
fprintf('error = %e\n\n', abs(geopdf(2, p) - mean(X == 2)))

fprintf('simulated probab. P(X <= 2) = %1.5f\n', mean(X <= 2))
fprintf('true probab. P(X <= 2) = %1.5f\n', geocdf(2, p))
fprintf('error = %e\n\n', abs(geocdf(2, p) - mean(X <= 2)))

fprintf('simulated probab. P(X < 2) = %1.5f\n', mean(X < 2))
fprintf('true probab. P(X < 2) = %1.5f\n', geocdf(1, p))
fprintf('error = %e\n\n', abs(geocdf(1, p) - mean(X < 2)))

fprintf('simulated mean E(X) = %5.5f\n', mean(X))
fprintf('true mean E(X) = %5.5f\n', (1 - p) / p)
fprintf('error = %e\n\n', abs((1 - p) / p - mean(X)))