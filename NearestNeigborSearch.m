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

function [BM, Cz] = NearestNeigborSearch(Co1,Pt,Qt,ho,wo)

scales = zeros(9,2);

[~,h,w] = size(Pt);

BM = zeros(1,5);

% Calculating the different scales to use for searching
% 9 different scales used 
if h == min(h,w)
  ratio = double(wo/ho); % Using object image ratio to select search region
  for j = 1:9
  scales(j,:) = [j*floor(h/9) j*floor(ratio*h/9)];
  end
elseif w == min(h,w)
  ratio = double(ho/wo); % Using object image ratio to select search region
  for j = 1:9
  scales(j,:) = [j*floor(ratio*w/9) j*floor(w/9)];
  end
end

i = 1;

% For each of the 9 scales, perform brute force search
for s = 1:9;
  
  hl = scales(s,1);
  wl = scales(s,2);
  hs = 1;
  while (hs <= (h - hl))
    ws = 1;
    while (ws <= (w - wl))
      C = RCovariance(Pt,Qt,hs,ws,(hs+hl),(ws+wl)); % Covariance matrix of each region
      Cz(i,:,:) = C; 
      d = CovarianceDistance(Co1,C); % Calculate distance
      BM(i,:) = [hs ws (hs+hl) (ws+wl) d]; % Save distance and coordinates to Matching location matrix
      i = i + 1;    
      ws = ws + 5;  %Shift search region 5 pixels horizontal
    end
    hs = hs + 5;  %Shift search region 5 pixels vertical
  end
end



