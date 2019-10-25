%
% Copyright 2014 by Kitware, Inc. All Rights Reserved. Please refer to
% LICENSE.TXT for licensing information, or contact General Counsel,
% Kitware, Inc., 28 Corporate Drive, Clifton Park, NY 12065.
%

function pan_tilt =img2pt(point, pp, focal)

p = atan2( point(1)-pp(1), focal);
t = atan2( point(2)-pp(2), norm([point(1) - pp(1),focal]));

pan_tilt = [p,t];