%CSDN:http://blog.csdn.net/sinat_30071459
%%
clc;
clear;

source_txt1='/home/lc408/cub_bird/VOC/VOC2007/img/output.txt';
source_txt2='/home/lc408/cub_bird/VOC/VOC2007/img/output.txt';
dest_txt='/home/lc408/cub_bird/VOC/VOC2007/img/output.txt';

imname=textread('CUB_200_2011/images.txt','%s');
flag=textread('CUB_200_2011/train_test_split.txt','%d');
fid = fopen('test.txt','wt'); 
for i=1:length(flag)
    if(flag(i)==0)
        line=imname{i};
        split_line=regexp(line, '\.', 'split');
        ccc=split_line{2};
        cls_name=regexp(split_line{2}, '\/', 'split');
        cls=cls_name{1};
        name=cls_name{2};
        fprintf(fid,'%s %s\n',cls,name);   
    end
end
a=1;
