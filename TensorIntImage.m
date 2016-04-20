% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Filename: TensorIntImage.m
%
%  Description: This function calculates the W x H x d tensor matrix from feature image
%  using equation 8
%  Region Covariance: A Fast Descriptor for Detection and Classification
%
%  Nkosikhona Gumede
%  University of KwaZulu Natal
%  208504751@stu.ukzn.ac.za
%  Aug 2015
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function P = TensorIntImage(F)

F = permute(F,[3 1 2]); % shift dimensions for cumsum (d x W x H)

[d,w,h] = size(F);

Ptemp = zeros(d,w+1,h+1);

Ptemp(:,2:end,2:end) = cumsum(cumsum(F,3),2);

P = Ptemp(:,2:end,2:end);

P = permute(P,[2 3 1]); % Permute back W x H x d

end