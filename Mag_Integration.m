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
for xo = 5:15
    for yo = -5:5
        for zo = 5:15
            P = [xo,yo,zo]; 
            % Segment 1
            % Rcubed = @(x) (sqrt((P(1)-x)^2 + (P(2)-ym)^2 + (P(3)-height)^2)^3);
            seg1dl = [-1,0,0];
            %Arx = @(x) P(1)-x;
            %Ary = P(2)-ym; 
            %Arz = P(3)-height;
            seg1CrossProdx = @(x) (I* (seg1dl(2)*(P(3)-height)   -seg1dl(3)*(P(2)-ym))     )./(4*pi*sqrt((P(1)-x).^2 + (P(2)-ym).^2 + (P(3)-height).^2).^3);
            seg1CrossPrody = @(x) (I* (seg1dl(3)*(P(1)-x)        -seg1dl(1)*(P(3)-height)) )./(4*pi*sqrt((P(1)-x).^2 + (P(2)-ym).^2 + (P(3)-height).^2).^3);
            seg1CrossProdz = @(x) (I* (seg1dl(1)*(P(2)-ym)       -seg1dl(2)*(P(1)-x))      )./(4*pi*sqrt((P(1)-x).^2 + (P(2)-ym).^2 + (P(3)-height).^2).^3);
            seg1H(1) = integral(seg1CrossProdx,0,length);
            seg1H(2) = integral(seg1CrossPrody,0,length);
            seg1H(3) = integral(seg1CrossProdz,0,length);
            %quiver3(xo,yo,zo,seg1H(1),seg1H(2),seg1H(3))

            seg2dl = [0,0,1];
            seg2CrossProdx = @(z) (I* (seg2dl(2)*(P(3)-z)       -seg2dl(3)*(P(2)-ym))     )./(4*pi*sqrt((P(1)-length).^2 + (P(2)-ym).^2 + (P(3)-z).^2).^3);
            seg2CrossPrody = @(z) (I* (seg2dl(3)*(P(1)-length)  -seg2dl(1)*(P(3)-z))      )./(4*pi*sqrt((P(1)-length).^2 + (P(2)-ym).^2 + (P(3)-z).^2).^3);
            seg2CrossProdz = @(z) (I* (seg2dl(1)*(P(2)-ym)      -seg2dl(2)*(P(1)-length)) )./(4*pi*sqrt((P(1)-length).^2 + (P(2)-ym).^2 + (P(3)-z).^2).^3);
            seg2H(1) = integral(seg2CrossProdx,0,height);
            seg2H(2) = integral(seg2CrossPrody,0,height);
            seg2H(3) = integral(seg2CrossProdz,0,height);
            %quiver3(xo,yo,zo,seg2H(1),seg2H(2),seg2H(3))

            hold on
            H(1) = seg1H(1)+seg2H(1);
            H(2) = seg1H(2)+seg2H(2);
            H(3) = seg1H(3)+seg2H(3);
            quiver3(xo,yo,zo,H(1),H(2),H(3))


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
            %Arx = @(x) (P(1)-x);
            %Ary = (P(2)-y); 
            %Arz = (P(3)-z);
            %xProdx =  seg2dl(2)*(P(3)-z)-seg2dl(3)*(P(2)-y);
            %xPrody =  seg2dl(3)*(P(1)-x)-seg2dl(1)*(P(3)-z);
            %xProdz =  seg2dl(1)*P(2)-y)-seg2dl(2)*(P(1)-x);
            %H1x = integral(xPrody,0,length)