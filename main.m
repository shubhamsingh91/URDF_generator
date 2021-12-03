clc; clear all; close all;

%% script to generate URDFs for serial chains

n_vec = 1;
% n_vec = [3:1:20];
% n_vec = [n_vec,25,30,35,40,45,50,60,70,80,90,100,120,150,180,200,220,250,280,300,320,350,380,400,420,450,480,500];

bf=1;

for ii=1:numel(n_vec)
    disp("n = ")
    disp(n_vec(ii))
    
    make_urdf(n_vec(ii));
%     make_urdf_branched(n_vec(ii),bf)

end