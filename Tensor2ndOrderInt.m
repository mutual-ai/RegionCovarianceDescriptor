% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Filename: Tensor2ndOrderInt.m
%
%  Description: This function calculates the W x H x d xd tensor matrix of 
%  second order integral image feature image using equation 9
%  Region Covariance: A Fast Descriptor for Detection and Classification
%
%  Nkosikhona Gumede
%  University of KwaZulu Natal
%  208504751@stu.ukzn.ac.za
%  Aug 2015
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Q = Tensor2ndOrderInt(F)

F = permute(F,[3 1 2]);

[d,h,w] = size(F);

% For each feature calculate the second order feature image as per equation 9
F2 = int64(zeros(d,d,h,w));
for i=1:d
    for j=1:d
        F2(i,j,:,:) = F(i,:,:).*F(j,:,:);
    end
end

% For each feature calculate the tensor matrix of the 2nd Order int image
Q = int64(zeros(d,d,h+1,w+1));
for i=1:d
    for j=1:d
        Q(i,j,:,:) = integralImage(squeeze(F2(i,j,:,:)));
    end
end
Q = Q(:,:,2:end,2:end);  % Q - 9 x 9 matrix for each feature

end