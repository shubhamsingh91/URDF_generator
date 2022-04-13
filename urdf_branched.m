clc; clear all; close all;

%% For branched URDFs


%% Adding spatial_v2 to the MATLAB path

% Determine where your m-file's folder is.
folder = fileparts(which(mfilename)); 
% % Add that folder plus all subfolders to the path.
addpath(genpath(folder));

n = 5;
bf = 2;

make_urdf_branched(n,bf)

