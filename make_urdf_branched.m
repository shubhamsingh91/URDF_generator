function out = make_urdf_branched(n,bf)


for ii=1:n

    parent_vec(ii) = floor((ii-2+ceil(bf))/bf);

end

for ii=1:n
    
    child_vec(ii) = ii;

end
%% 

robot_name = strcat(num2str(n),'link_bf_',num2str(bf));
filename = strcat(robot_name,'.urdf');

fileID = fopen(filename,'w');

str0 = '<?xml version="1.0" encoding="utf-8"?>';

str1 = strcat('<robot name="',robot_name,'"> \n \n');


fprintf(fileID,str0);
fprintf(fileID,'\n \n'); % new line
fprintf(fileID,str1);

%% dictionary for child/parent

for ii=1:n
 
   if parent_vec(ii)==0
     parent_vec_name{ii} = '"base_link"';
   else
     parent_vec_name{ii}=strcat('"link',num2str(parent_vec(ii)),'"');
   end
     child_vec_name{ii} = strcat('"link',num2str(child_vec(ii)),'"');

end

  parent = containers.Map(parent_vec,parent_vec_name);
  child = containers.Map(child_vec,child_vec_name);
  
%% link info- base link

link_name = '"base_link"';
link_xyz_vec = [0,0,0];
link_rpy_vec = [0,0,0];
link_mass_num = 0;
link_inertia_mat = [0,0,0,0,0,0]; % Ixx, xy,xz,yy,yz,zz


input.link_name = link_name;
input.link_xyz_vec = link_xyz_vec;
input.link_rpy_vec = link_rpy_vec;
input.link_mass_num = link_mass_num;
input.link_inertia_mat = link_inertia_mat;

 str_link = link_name_str(input);

fprintf(fileID,str_link);

%% link description

% assuming all links of length = 1

l=1;

for ii=1:n
    
    
    % link info
    
    input.link_name = strcat('"link',num2str(ii),'"');
    input.link_xyz_vec = [parent_vec(ii)*l,0,0];
    input.link_rpy_vec = [0,0,0];
    input.link_mass_num=1.5;
    input.link_inertia_mat = [0,0,0,0,0,1];
    
 str_link = link_name_str(input);
    fprintf(fileID,str_link);

    
end


%% joint description


for ii=1:n

    input_jt.joint_name = strcat('"joint',num2str(ii),'"');
    input_jt.joint_type = strcat('"revolute"');
    input_jt.joint_xyz_vec = [parent_vec(ii)*l,0,0];
    input_jt.joint_rpy_vec = [0,0,0];
    input_jt.joint_parent = parent(parent_vec(ii));
    input_jt.joint_child = child(child_vec(ii));
    input_jt.joint_axis = [0,0,1]; % reovlute z axis joint here
    input_jt.limits = [0,0,0,0]; % lower, upper, effort, vecloity
    input_jt.damping = 0.05; % damping
       
 str_joint = jt_name_str(input_jt);
    fprintf(fileID,str_joint);

    
end

%% file ending

strend = '\n \n </robot>';
fprintf(fileID,strend);
fclose(fileID);