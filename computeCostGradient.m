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
## @deftypefn {Function File} {@var{retval} =} computeCostGradient (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: juigilkishore <juigilkishore@juigilkishore-Studio-1555>
## Created: 2016-04-24

function [cost, gradient_regularized] = computeCostGradient (y, X, theta, M, lambda)
  hypothesis = sigmoid(X*theta);  # Mx1
  cost = -1*mean(y.*log(hypothesis) + (1-y).*log(1 - hypothesis)) + ...
         (lambda/2)*mean(theta(2:end).*theta(2:end));  # 1x1
  gradient = (1/M)*X'*(hypothesis - y);   # Nx1
  gradient_regularized = gradient + [0; (lambda/M)*theta(2:end)];

endfunction
