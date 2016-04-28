## Copyright (C) 2016 juigilkishore
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} oneVsAll (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: juigilkishore <juigilkishore@juigilkishore-Studio-1555>
## Created: 2016-04-24

function [theta_all] = oneVsAll (y, X, M, N, LABELS)
  plot_code = ['-+k', '-or', '-*g', '-.b', '-xm', 'k', 'r', 'g', 'b', 'm'];
  K = length(LABELS);
  theta_all = zeros(N, K);
  alpha = 1E-5;
  numIterations = 2000;
  lambda = 100;   # Regularization parameter
  for k = 0:K-1
    fprintf("Evaluating the features for digit %d\n", k)
    fflush(stdout);
    theta_init = zeros(N, 1);
    y_k = y==k;
    [theta_k, cost] = gradientDescent(y_k, X, M, theta_init, alpha, numIterations, lambda);
    theta_all(:, k+1) = theta_k;  # NxK
    
    plot(1:length(cost), cost, plot_code(k+1));
    axis tight; grid on; hold on;
  end

end
