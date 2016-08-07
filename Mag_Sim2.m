clc;
clear;

Height = 7; % [cm]
Width = 2; % [cm]
Length = 7; % [cm]
AgLength = 0.001; % [cm]
Depth = 2; % [cm]
Uc = 2.5e-1; % (iron) Magnetic permeability of the  core [H/m]
Ua = 1.256627e-6; % Magnetic permeability of water [H/m]
N = 30; % NUmber of turns
I = 5; %Current [A]


F = N*I; % Magnetomotive Force [A*m]
R1 = Height/(Uc*Width*Depth);
R2 = (Length-2*Width)/(Uc*Width*Depth);
R3 = (Length-2*Width)/(Uc*Width*Depth);
R4 = (Height-AgLength)/(Uc*Width*Depth);
R5 = AgLength/(Ua*Width*Depth);
Rt = R1 + R2 + R3 + R4 + R5;
Flux = F/Rt; % [Wb] or [T/cm^2]

B = Flux * Width * Depth


