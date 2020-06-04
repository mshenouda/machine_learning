function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.

%

m = length(y);
j = 1;
k = 1;

for i = 1:m
    if (y(i) >=1)
        accepted(j, :) = X(i,:);
        j=j+1;
    else
        rejected(k, :) = X(i,:);
        k=k+1;
    end
end

plot(accepted(:,1),accepted(:,2),'k+',rejected(:,1),rejected(:,2),'ko');
legend('admitted', 'not admitted');
xlabel('Exam 1 grades');
ylabel('Exam 2 grades');
title('Exam 1 and Exam 2');
% =========================================================================



hold off;

end
