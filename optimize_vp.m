%
% Copyright 2014 by Kitware, Inc. All Rights Reserved. Please refer to
% LICENSE.TXT for licensing information, or contact General Counsel,
% Kitware, Inc., 28 Corporate Drive, Clifton Park, NY 12065.
%

function vp = optimize_vp(vp,args,pp,focal)

if strcmp(char(args.opt_option), 'max-log')
    vp = max_log_vp(vp, args, pp, focal);
elseif strcmp(char(args.opt_option), 'min-error')
    vp = min_error_vp( vp,  args, pp, focal );
else
    vp = min_error_vp( vp,  args, pp, focal );
end
