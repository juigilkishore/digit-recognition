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
## @deftypefn {Function File} {@var{retval} =} sigmoid (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: juigilkishore <juigilkishore@juigilkishore-Studio-1555>
## Created: 2016-04-24

function [g] = sigmoid (z)
  g = 1./(1 + exp(-z));

endfunction
