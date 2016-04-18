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

F = permute(F,[3 1 2]); % shift dimensions

[d,h,w] = size(F);

P = int64(zeros(d,h+1,w+1));

% For each feature in feature matrix calculate the integral image (Equation 10)
for i=1:d
    P(i,:,:) = integralImage(squeeze(int64(F(i,:,:))));
end
P = P(:,2:end,2:end);

end