function str_link = link_name_str(input)

link_xyz = strcat('"',num2str(input.link_xyz_vec(1)),{' '},...
                num2str(input.link_xyz_vec(2)),{' '},num2str(input.link_xyz_vec(3)),' ','"');


link_rpy = strcat('"',num2str(input.link_rpy_vec(1)),{' '},...
                num2str(input.link_rpy_vec(2)),{' '},num2str(input.link_rpy_vec(3)),' ','"');
            
link_mass = strcat('"',num2str(input.link_mass_num),'"');



for ii=1:6
    iner_str{ii} = strcat('"',num2str(input.link_inertia_mat(ii)),'"');
end

str_link = strcat('\n \n <link \n   name=',...
    input.link_name,'> \n ',...
    '     <inertial> \n     <origin \n      xyz=',link_xyz{1} ,...
    ' \n      rpy=',link_rpy{1},'/> \n',...
      '    <mass \n     value=',link_mass,...
      '/> \n    <inertia','\n       ixx=',iner_str{1} ,...
      '\n       ixy=',iner_str{2}, ...
      '\n       ixz=',iner_str{3}, '\n       iyy=',iner_str{4},...
      '\n       iyz=',iner_str{5}, '\n       izz=',iner_str{6}, ' />',...
      '\n     </inertial>','\n </link>');