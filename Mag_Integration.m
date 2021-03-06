clc;
clear;
%% Declare variables
height = 10;
width = 10;
length = 10;
n = 100;
I = 5;
ym = 0;

%% Main for Loop
for xo = -5:2.5:15
    for yo = -5:5
        for zo = -5:2.5:15
            P = [xo,yo,zo]; 
            %% Segment 1
            seg1dl = [-1,0,0];
            seg1CrossProdx = @(x) (I* (seg1dl(2)*(P(3)-height)   -seg1dl(3)*(P(2)-ym))     )./(4*pi*sqrt((P(1)-x).^2 + (P(2)-ym).^2 + (P(3)-height).^2).^3);
            seg1CrossPrody = @(x) (I* (seg1dl(3)*(P(1)-x)        -seg1dl(1)*(P(3)-height)) )./(4*pi*sqrt((P(1)-x).^2 + (P(2)-ym).^2 + (P(3)-height).^2).^3);
            seg1CrossProdz = @(x) (I* (seg1dl(1)*(P(2)-ym)       -seg1dl(2)*(P(1)-x))      )./(4*pi*sqrt((P(1)-x).^2 + (P(2)-ym).^2 + (P(3)-height).^2).^3);
            seg1H(1) = integral(seg1CrossProdx,0,length);
            seg1H(2) = integral(seg1CrossPrody,0,length);
            seg1H(3) = integral(seg1CrossProdz,0,length);
            %quiver3(xo,yo,zo,seg1H(1),seg1H(2),seg1H(3))

            %% Segment 2
            seg2dl = [0,0,1];
            seg2CrossProdx = @(z) (I* (seg2dl(2)*(P(3)-z)       -seg2dl(3)*(P(2)-ym))     )./(4*pi*sqrt((P(1)-length).^2 + (P(2)-ym).^2 + (P(3)-z).^2).^3);
            seg2CrossPrody = @(z) (I* (seg2dl(3)*(P(1)-length)  -seg2dl(1)*(P(3)-z))      )./(4*pi*sqrt((P(1)-length).^2 + (P(2)-ym).^2 + (P(3)-z).^2).^3);
            seg2CrossProdz = @(z) (I* (seg2dl(1)*(P(2)-ym)      -seg2dl(2)*(P(1)-length)) )./(4*pi*sqrt((P(1)-length).^2 + (P(2)-ym).^2 + (P(3)-z).^2).^3);
            seg2H(1) = integral(seg2CrossProdx,0,height);
            seg2H(2) = integral(seg2CrossPrody,0,height);
            seg2H(3) = integral(seg2CrossProdz,0,height);
            %quiver3(xo,yo,zo,seg2H(1),seg2H(2),seg2H(3))

            %% Segment 3
            seg3dl = [1,0,0];
            seg3CrossProdx = @(x) (I* (seg3dl(2)*(P(3))   -seg3dl(3)*(P(2)-ym))     )./(4*pi*sqrt((P(1)-x).^2 + (P(2)-ym).^2 + (P(3)).^2).^3);
            seg3CrossPrody = @(x) (I* (seg3dl(3)*(P(1)-x)        -seg3dl(1)*(P(3))) )./(4*pi*sqrt((P(1)-x).^2 + (P(2)-ym).^2 + (P(3)).^2).^3);
            seg3CrossProdz = @(x) (I* (seg3dl(1)*(P(2)-ym)       -seg3dl(2)*(P(1)-x))      )./(4*pi*sqrt((P(1)-x).^2 + (P(2)-ym).^2 + (P(3)).^2).^3);
            seg3H(1) = integral(seg3CrossProdx,0,length);
            seg3H(2) = integral(seg3CrossPrody,0,length);
            seg3H(3) = integral(seg3CrossProdz,0,length);
            %quiver3(xo,yo,zo,seg1H(1),seg1H(2),seg1H(3))
            
            %% Segment 4
            seg4dl = [0,0,-1]
            seg4CrossProdx = @(z) (I* (seg4dl(2)*(P(3)-z)       -seg4dl(3)*(P(2)-ym))     )./(4*pi*sqrt((P(1)).^2 + (P(2)-ym).^2 + (P(3)-z).^2).^3);
            seg4CrossPrody = @(z) (I* (seg4dl(3)*(P(1))  -seg4dl(1)*(P(3)-z))      )./(4*pi*sqrt((P(1)).^2 + (P(2)-ym).^2 + (P(3)-z).^2).^3);
            seg4CrossProdz = @(z) (I* (seg4dl(1)*(P(2)-ym)      -seg4dl(2)*(P(1))) )./(4*pi*sqrt((P(1)).^2 + (P(2)-ym).^2 + (P(3)-z).^2).^3);
            seg4H(1) = integral(seg4CrossProdx,0,height);
            seg4H(2) = integral(seg4CrossPrody,0,height);
            seg4H(3) = integral(seg4CrossProdz,0,height);           
            %% Plot Graph
            hold on
            H(1) = seg1H(1)+seg2H(1)+seg3H(1)+seg4H(1);
            H(2) = seg1H(2)+seg2H(2)+seg3H(2)+seg4H(2)
            H(3) = seg1H(3)+seg2H(3)+seg3H(3)+seg4H(3)
            quiver3(xo,yo,zo,H(1),H(2),H(3))


        end 
    end
end

