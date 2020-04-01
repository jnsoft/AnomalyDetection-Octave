function [bestEpsilon bestF1] = selectThreshold(yval, pval)
%SELECTTHRESHOLD Find the best threshold (epsilon) to use for selecting
%outliers
%   [bestEpsilon bestF1] = SELECTTHRESHOLD(yval, pval) finds the best
%   threshold to use for selecting outliers based on the results from a
%   validation set (pval) and the ground truth (yval).
%

bestEpsilon = 0;
bestF1 = 0;
F1 = 0;

stepsize = (max(pval) - min(pval)) / 1000
for epsilon = min(pval):stepsize:max(pval)
	yAll = [yval (pval < epsilon)];
	yYes = yAll(yAll(:,1)==1,:);
	yNo = yAll(yAll(:,1)==0,:);
	tp = sum( (yYes)(:,1) == (yYes)(:,2)); % true positives
	fp = sum(yNo)(:,2); % false positives
	fn = sum(yYes)(:,2) - sum(yYes)(:,2); % false negatives
	
	prec = tp/(tp+fp); % precision
	rec = tp/(tp+fn); % recall
	
	F1 = (2*prec*rec)/(prec+rec); % F1 score
	

    if F1 > bestF1
       bestF1 = F1;
       bestEpsilon = epsilon;
    end
end

end
