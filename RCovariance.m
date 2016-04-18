%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Filename: RCovariance.m
%
%  Description: This function calculates the covariance matrix as per equation 12
%  from the first and second order tensors equation 10
%  Region Covariance: A Fast Descriptor for Detection and Classification
%
%  Nkosikhona Gumede
%  University of KwaZulu Natal
%  208504751@stu.ukzn.ac.za
%  Aug 2015
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Cr = RCovariance(P,Q,yp,xp,ypp,xpp)

Rq = double(Q(:,:,ypp,xpp) + Q(:,:,yp,xp) - Q(:,:,ypp,xp) - Q(:,:,yp,xpp)); % First term
Rp = double(P(:,ypp,xpp) + P(:,yp,xp) - P(:,ypp,xp) - P(:,yp,xpp));   % Second term

n = (ypp - yp)*(xpp - xp);

Cr = 1/(n - 1) * (double(Rq) - (1/n) * (Rp*Rp')); %Covariance matrix - equation 12

end