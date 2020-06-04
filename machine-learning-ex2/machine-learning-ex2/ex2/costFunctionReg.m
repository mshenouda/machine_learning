function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

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

for i = 1: m
    h_theta = sigmoid(X(i,:) * theta);
    logh = log(h_theta);
    logh_1 = log(1-h_theta);
    J = J + (-y(i)*logh - (1-y(i))*logh_1); 
end
J = J/m;
reg = lambda/(2*m)*sum(theta(2:end).^2,1);
J = J+reg;

% ====================== Computing gradients ======================

for i = 1:m
    h_theta = sigmoid(X(i,:) * theta) - y(i);
    for j = 1:size(X,2)
        grad(i,j) = h_theta * X(i,j); 
    end
end

grad = 1/m*sum(grad,1);
grad = grad(:);
theta(1) = 0;
theta(2:end) = (lambda/m)*theta(2:end); 
grad = grad + theta;
% =============================================================

end
