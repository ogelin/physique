function graphique ()
x = [1 1 1 1 0.95 0.95 0.95 0.95 0.85 0.85 0.85 0.85 0.8 0.8 0.8 0.8 0.75 0.75 0.75 0.75]';
y = [0.3 0.2 0.15 0.1 0.3 0.2 0.15 0.1 0.3 0.2 0.15 0.1 0.3 0.2 0.15 0.1 0.3 0.2 0.15 0.1]';
z = [0.1 0.15 0.2 0.3 0.1 0.15 0.2 0.3 0.1 0.15 0.2 0.3 0.1 0.15 0.2 0.3 0.1 0.15 0.2 0.3]';

%xTerrain = [0 0 120 120]';
%yTerrain = [0 90 90 0]';
%zTerrain = [0 0 0 0]';
%Pour le terrain
terrain = [[0 0 0];[0 90 0];[120 0 0];[120 90 0]];
gazon = plot3(terrain(:,1), terrain(:,2), terrain(:,3));
gazon.Color = 'blue';

xr = reshape(x, 4, 5);
yr = reshape(y, 4, 5);
zr = reshape(z, 4, 5);

xTerrain = 120;
yTerrain = 90;
zTerrain = 0;



terrainGazon = surf(xTerrain, yTerrain, zTerrain);

hold on;
%surf(xTerrain, yTerrain, zTerrain, 'r' );
hold on;
scatter3(x,y,z);
xlabel('x');
ylabel('y');
zlabel('z');

endfunction
