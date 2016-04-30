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
## @deftypefn {Function File} {@var{retval} =} featureScaling (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: juigilkishore <juigilkishore@juigilkishore-Studio-1555>
## Created: 2016-04-28

function [X] = featureScaling (X1)
  M = size(X1)(1);
  X1 = X1(:, 2:end);
  mu_X1 = repmat(mean(X1), M, 1);
  sigma_X1 = sqrt(mean((X1 - mu_X1).*(X1 - mu_X1)));
  sigma_X1(find(sigma_X1 == 0)) = 1;
  sigma_X1 = repmat(sigma_X1, M, 1);
  X = (X1 - mu_X1)./sigma_X1;
  X = [ones(M, 1) X];

endfunction
