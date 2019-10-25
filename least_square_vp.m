%
% Copyright 2014 by Kitware, Inc. All Rights Reserved. Please refer to
% LICENSE.TXT for licensing information, or contact General Counsel,
% Kitware, Inc., 28 Corporate Drive, Clifton Park, NY 12065.
%

function vp=least_square_vp(lsegs)

l_length = lsegs(:,7);
l = lsegs(:,8:10);
w = diag(l_length);

[eigV, lambda] = eig(l'*w'*w*l);
[tmp, smallest] = min(diag(lambda));
v = eigV(:, smallest);
v = v / v(3);
vp=v'; % like to be a row vector

