function H = composeFrames(F,G)

% COMPOSEFRAMES  Compose two 3D frames.
%   H = COMPOSEFRAMES(F,G) composes frames F and G, where frame G is
%   specified in frame F, to get a single frame transform H. Frames are
%   structures with at least the following fields:
%       .t  translation vector
%       .q  orientation quaternion
%
%   The resulting frame H, however, contains the full frame structure.
%
%   See also FRAME, SPLITFRAME, QUATERNION.

%   Copyright 2008-2009 Joan Sola @ LAAS-CNRS.

H.t = fromFrame(F,G.t);
H.q = qProd(F.q,G.q);
H.x = [H.t;H.q];
H   = updateFrame(H);
