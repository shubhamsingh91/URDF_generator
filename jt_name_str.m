function str_joint = jt_name_str(input)

% this function creates the info for joints
joint_xyz = strcat('"',num2str(input.joint_xyz_vec(1)),{' '},...
                num2str(input.joint_xyz_vec(2)),{' '},...
                num2str(input.joint_xyz_vec(3)),' ','"');


joint_rpy = strcat('"',num2str(input.joint_rpy_vec(1)),{' '},...
                num2str(input.joint_rpy_vec(2)),{' '},...
                num2str(input.joint_rpy_vec(3)),' ','"');
    
joint_axis =  strcat('"',num2str(input.joint_axis(1)),{' '},...
                num2str(input.joint_axis(2)),{' '},...
                num2str(input.joint_axis(3)),' ','"');

for ii=1:4
    joint_str{ii} = strcat('"',num2str(input.limits(ii)),'"');
end

damp_str = strcat('"',num2str(input.damping),'"');

str_joint = strcat('\n \n <joint \n   name=',...
    input.joint_name,' \n ',...
    '   type=', input.joint_type,'> \n',...
    '    <origin \n      xyz=',joint_xyz{1} ,...
    ' \n      rpy=',joint_rpy{1},'/> \n',...
      '    <parent \n     link=',input.joint_parent,...
      '/> \n  ' , '    <child \n     link=',input.joint_child,...
      '/> \n  ' ,'    <axis \n     xyz=',joint_axis{1},...
      '/> \n', '    <limit \n     lower=',joint_str{1},...
      '\n      upper=',joint_str{2},...
      '\n      effort=',joint_str{3},...
      '\n      velocity=',joint_str{4},'  />',... 
      '\n     <dynamics','\n     damping=',damp_str,'  />',...
      '\n </joint>');
  
  
  