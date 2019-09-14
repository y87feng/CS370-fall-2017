
% test_MySpline.m
%
% If you get your MySpline function working properly, it should return
% the pwc structure below.

y = [1 3 4 2 -1 1];
t = [0 1 2 3  4 5];

% Call your MySpline function.
pwc = MySpline(t, y);

% Be default, this script ignores the spline your MySpline function
% creates, and instead overwrites them with the correct values
% (corresponding to the (y,t) points above).
% To see if YOUR spline function produces the same spline, change the
% "if 1" to "if 0" and your result will be used for plotting.
if 1
    % Corresponds to
    %   y = [1 3 4 2 -1 1];
    %   t = [0 1 2 3  4 5];
    pwc.a = [     0   -0.5742   -3.7033   -2.6124    8.1531         0];
    pwc.b = [1.0000    3.0957    4.6172    2.4354   -2.3589];
    pwc.c = [3.0957    4.6172    2.4354   -2.3589    1.0000];
end

% Create a finer sampling of the parameter.
tt = linspace(t(1), t(end), 100);

% Evaluate the spline at that finer resolution.
S = EvaluateMySpline(t, pwc, tt);

% And plot the points and the spline.
plot(t, y, 'ro', tt, S);
% Add a small margin around the plot to make it look better.
blah = axis; blah = blah + [-1 1 -1 1]/10;
axis(blah);

