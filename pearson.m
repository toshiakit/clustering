function[Y] = pearson(X)
%PEARSON  Calculate Pearson Correlation%
    % Calculates Pearson Correlation Distance for a logical matrix X
    % Emulates a pdist function format
    % X is a logical matrix (sample x variable)
    % Y is an upper triangular square vector 
    % See here for the actual equation:
    % http://davidmlane.com/hyperstat/A51911.html
    
    r =zeros(size(X,1));
    for i=1:size(X,1);
        for j=1:size(X,1);
            if i~=j;
 
                % get the rows
                x=X(i,:);
                y=X(j,:);
                n=size(X,2);
            
                % simple sums Sum(X), Sum(Y)
                sumx = sum(x);
                sumy = sum(y);
            
                % sum of squares Sum(X^2), Sum(X^2)
                sumxSq = sum(x.^2);
                sumySq = sum(y.^2);
            
                % sum of products Sum(X*Y)
                pSum = sum(x.*y);
            
                % numerator of Pearson equation
                num = pSum - (sumx*sumy/n);
            
                % denominator of Pearson equation
                den = sqrt((sumxSq-sumx^2/n)*(sumySq-sumy^2/n));
            
                % caluculate Pearson score
                if den==0
                    r(i,j) = 0;
                else
                % Pearson correlation is 1.0 when two items match perfectly
                % and close to 0.0 when there's no relationship. Modify the
                % equation a bit to return smaller distance when two items 
                % are more similar.
                    r(i,j)=1.0-num/den;
                end
            end
        end
    end
    Y = squareform(r);