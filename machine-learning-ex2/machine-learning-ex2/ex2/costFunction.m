function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%

for i = 1: m
    h_theta = sigmoid(X(i,:)*theta);
    logh = log(h_theta);
    logh_1 = log(1-h_theta);
    J = J + (-y(i)*logh - (1-y(i))*logh_1); 
end
J = J/m;

result = zeros(m,size(X,2));

for i = 1:m
    h_theta = sigmoid(X(i,:) * theta) - y(i);
    for j = 1:size(X,2)
        result(i,j) = h_theta * X(i,j); 
    end
end
grad = 1/m*sum(result,1);
grad = grad';
% =============================================================

end
