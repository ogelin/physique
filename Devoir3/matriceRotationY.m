function [result] = matriceRotationY(theta)
  result = [cos(theta), 0, sin(theta); 
            0,1,0;
            -sin(theta), 0, cos(theta)];
endfunction
