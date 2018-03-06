function [B,C,P] = vsh(n,m,theta,phi)
% vsh.m : Vector spherical harmonics. If m not specified will output for
%           all m. Vector m input allowed.
%
% Usage:
% [B,C,P] = vsh(n,m,theta,phi)
% or
% [B,C,P] = vsh(n,theta,phi)
%
% Scalar n for the moment.
%
% If scalar m: B,C,P are arrays of size length(theta,phi) x 3
% If vector m: B,C,P are arrays of size length((theta,phi),m) x 3
% theta and phi can be vectors (of equal length) or scalar.
%
% The three components of each vector are [r,theta,phi]
%
% "Out of range" n and m result in return of [0 0 0]
%
% PACKAGE INFO

import ott.*

if length(n)>1
    error('n must be a scalar in this version')
end

if nargin<4
    phi=theta;
    theta=m;
    m=[-n:n];
end

% Convert a scalar theta or phi to a vector to match a vector
% partner
[theta,phi] = matchsize(theta,phi);

[Y,Ytheta,Yphi] = spharm(n,m,theta,phi);

%this makes the vectors go down in m for n. has no effect if old version
%code.

Z = zeros(size(Y));

B = [Z,Ytheta,Yphi];

C = [Z,Yphi,-Ytheta];

P = [Y,Z,Z];

return

