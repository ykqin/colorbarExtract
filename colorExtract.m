% RGB ��Ԫ���ǰ�������Ԫ�ص���ʸ������Ԫ�طֱ�ָ����ɫ�к졢�̡���������ǿ�ȡ�
% ǿ��ֵ����λ�� [0,1] ��Χ�ڣ����� [0.4 0.6 0.7]��
% �±��г����Ͷ���ɫ����ѡ���Լ���Ӧ�� RGB ��Ԫ��ֵ��
% ������	������	RGB ��Ԫ��
% 'yellow'	'y'	[1 1 0]
% 'magenta'	'm'	[1 0 1]
% 'cyan'	'c'	[0 1 1]
% 'red'	'r'	[1 0 0]
% 'green'	'g'	[0 1 0]
% 'blue'	'b'	[0 0 1]
% 'white'	'w'	[1 1 1]
% 'black'	'k'	[0 0 0]


clear;
clc;

I = imread('color.jpg');

R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);

[row,column] = size(R);

R_value = round(sum(R,2)/column)/255;
G_value = round(sum(G,2)/column)/255;
B_value = round(sum(B,2)/column)/255;

RGB = [R_value,G_value,B_value];
colorbar = RGB(end:-1:1,:);

numExtract = 64;  % Matlab colorbar ��Ҫ64��RGB��Ԫ��
stepExtract = floor(row/(numExtract-1));
j = 1;
for i = 1:stepExtract:row
    index(j) = i;
    if j > 63
        break;
    end
    j = j + 1;
end

colorbar = colorbar(index,:);

save('image_colorbar.mat','colorbar')





