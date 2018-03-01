% RGB 三元数是包含三个元素的行矢量，其元素分别指定颜色中红、绿、蓝分量的强度。
% 强度值必须位于 [0,1] 范围内，例如 [0.4 0.6 0.7]。
% 下表列出长和短颜色名称选项以及对应的 RGB 三元数值。
% 长名称	短名称	RGB 三元数
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

numExtract = 64;  % Matlab colorbar 需要64个RGB三元数
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





