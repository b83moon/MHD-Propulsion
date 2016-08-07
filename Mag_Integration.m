clc;
clear;

% Declare variables
height = 10;
width = 10;
length = 10;
n = 100;
I = 5;
ym = 0;
%Point in space under analysis
for xo = 0:5
    for yo = 0:5
        for zo = 0:3:20
            P = [xo,yo,zo]; 
            % Segment 1
            % Rcubed = @(x) (sqrt((P(1)-x)^2 + (P(2)-ym)^2 + (P(3)-height)^2)^3);
            dl = [1,0,0];
            %Arx = @(x) P(1)-x;
            %Ary = P(2)-ym; 
            %Arz = P(3)-height;
            xProdx = @(x) (I*dl(2)*(P(3)-height)-dl(3)*(P(2)-ym))./(4*pi*sqrt((P(1)-x).^2 + (P(2)-ym).^2 + (P(3)-height).^2).^3);
            xPrody = @(x) (I*dl(3)*(P(1)-x)-dl(1)*(P(3)-height))./(4*pi*sqrt((P(1)-x).^2 + (P(2)-ym).^2 + (P(3)-height).^2).^3);
            xProdz = @(x) (I*dl(1)*(P(2)-ym)-dl(2)*(P(1)-x))./(4*pi*sqrt((P(1)-x).^2 + (P(2)-ym).^2 + (P(3)-height).^2).^3);
            H1(1) = integral(xProdx,0,length);
            H1(2) = integral(xPrody,0,length);
            H1(3) = integral(xProdz,0,length);
            hold on
            xlabel('x');
            ylabel('y');
            zlabel('z');
            quiver3(xo,yo,zo,H1(1),H1(2),H1(3))
        end 
    end
end


% R = @(x,y,z) sqrt((P(1)-x)^2 + (P(2)-y)^2 + (P(3)-z)^2);
% Ar = @(x,y,z) [P(1)-x , P(2)-y , P(3)-z]


            %xProdx = [dl(2)*Arz-dl(3)*Ary;
            %xPrody = @(x) dl(3)*Arx-dl(1)*Arz;
            %xProdz = @(x) dl(1)*Ary-dl(2)*Arx;
            
            
            
            %Rcubed = @(x) sqrt((P(1)-x)^2 + (P(2)-ym)^2 + (P(3)-height)^2)^3;
            %dl = [1,0,0];
            %Arx = @(x) P(1)-x;
            %Ary = P(2)-ym; 
            %Arz = P(3)-height;
            %xProdx = @(x) dl(2)*Arz-dl(3)*Ary;
            %xPrody = @(x) dl(3)*Arx-dl(1)*Arz;
            %xProdz = @(x) dl(1)*Ary-dl(2)*Arx;
            %H1x = integral(xPrody,0,length)