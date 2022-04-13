clc; clear all; close all;

%% script to generate URDFs for serial chains

n_vec = 10;
% n_vec = [3:1:20];
n_vec = [65,70,75,80,85,90,95,100,105,110,115,120,125,130,140,150,160,180,200,220,250];

bf=2;

for ii=1:numel(n_vec)
    disp("n = ")
    disp(n_vec(ii))
    
%     make_urdf(n_vec(ii)); % NOT TO BE USED 
     make_urdf_branched(n_vec(ii),bf) % for serial chains, use with bf=1

end