%
% Copyright 2014 by Kitware, Inc. All Rights Reserved. Please refer to
% LICENSE.TXT for licensing information, or contact General Counsel,
% Kitware, Inc., 28 Corporate Drive, Clifton Park, NY 12065.
%

function gauss_point = img2gaussPoint(vp,pp,focal)

temp = norm([vp(1)-pp(1),focal]);
radius = norm([temp,vp(2)-pp(2)]);

gauss_point = [vp(1)-pp(1), vp(2)-pp(2), focal ] / radius;

