%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Filename: NearestNeighborSearch.m
%
%  Description: Thiss function searches the target image, calculates the dissimilarity
%  of each selected target image region to object image covariance matrix
%  Region Covariance: A Fast Descriptor for Detection and Classification
%
%  Nkosikhona Gumede
%  University of KwaZulu Natal
%  208504751@stu.ukzn.ac.za
%  Aug 2015
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [BM, Cz] = NearestNeigborSearch(Co1,Pt,Qt,wo,ho)

scales = zeros(9,2);

[w,h,~] = size(Pt);

BM = zeros(1,5);

% Calculating the different scales to use for searching
% 9 different scales used 
if h == min(w,h)
  ratio = double(wo/ho); % Using object image ratio to select search region
  for j = 1:9
  scales(j,:) = [j*floor(ratio*h/9) j*floor(h/9)]; % 9 scales (W x H) when height is smaller
  end
elseif w == min(w,h)
  ratio = double(ho/wo); % Using object image ratio to select search region
  for j = 1:9
  scales(j,:) = [j*floor(w/9) j*floor(ratio*w/9)]; % 9 scales (W x H) when width is smaller
  end
end

i = 1;
z = 1;
% For each of the 9 scales, perform brute force search
for s = 1:9;
  
  wl = scales(s,1);
  hl = scales(s,2);
  hs = 1;
  while (hs <= (h - hl))
    ws = 1;
    while (ws <= (w - wl))
      C = RCovariance(Pt,Qt,ws,hs,(ws+wl),(hs+hl)); % Covariance matrix of each region
      [R,p] = chol(C);
      if (p~=0)
         % z = z + 1;
         % fprintf('Covariance matrix is not positive definite symmetric matrix\n');
         % fprintf('P = %d   dimesnions %d %d %d %d\n\n',p,ws,hs,ws+wl,hs+hl);
      else
      Cz(i,:,:) = C; 
      d = CovarianceDistance(Co1,C); % Calculate distance
      end
      BM(i,:) = [ws hs (ws+wl) (hs+hl) d]; % Save distance and coordinates to Matching location matrix
      i = i + 1;    
      ws = ws + 5;  %Shift search region 5 pixels horizontal
    end
    hs = hs + 5;  %Shift search region 5 pixels vertical
  end
end

disp('Wait for me to respond');





