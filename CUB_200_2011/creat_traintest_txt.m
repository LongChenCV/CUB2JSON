%make train/testbbox.txt(bounding boxes) and train/test.txt(image names)
clc;
clear;
%x2 is width, y2 is height
[imid,x1,y1,x2,y2]=textread('bounding_boxes.txt','%d%.2f%.2f%.2f%.2f');
[imid,imname]=textread('images.txt','%d%s');
[imid,imflag]=textread('train_test_split.txt','%d%d');
trainbboxfid = fopen('trainbbox.txt','wt'); 
testbboxfid = fopen('testbbox.txt','wt'); 
trainfid = fopen('trainval.txt','wt'); 
testfid = fopen('test.txt','wt'); 
for i=1:length(imflag)
    if(imflag(i)==1)
        line=imname{i};
        split_line=regexp(line, '\.', 'split');
        ccc=split_line{2};
        cls_name=regexp(split_line{2}, '\/', 'split');
        cls=lower(cls_name{1});
        name=cls_name{2};
        fprintf(trainbboxfid,'%s.jpg %s %.2f %.2f %.2f %.2f\n',name,cls,x1(i),y1(i),x1(i)+x2(i),y1(i)+y2(i));  
        fprintf(trainfid,'%s\n',name);
    else
        line=imname{i};
        split_line=regexp(line, '\.', 'split');
        ccc=split_line{2};
        cls_name=regexp(split_line{2}, '\/', 'split');
        cls=lower(cls_name{1});
        name=cls_name{2};
        fprintf(testbboxfid,'%s.jpg %s %.2f %.2f %.2f %.2f\n',name,cls,x1(i),y1(i),x1(i)+x2(i),y1(i)+y2(i));   
        fprintf(testfid,'%s\n',name);   
    end
end


% %copy images in multi-level file to one defined file
% maindir = '/home/lc408/cub_bird/CUB_200_2011/CUB_200_2011/images';
% subdir  = dir( maindir );
% for i = 1 : length( subdir )
%     if( isequal( subdir( i ).name, '.' )||...
%         isequal( subdir( i ).name, '..')||...
%         ~subdir( i ).isdir)               % 如果不是目录则跳过
%         continue;
%     end
%     subdirpath = fullfile( maindir, subdir( i ).name );
%     image = dir( subdirpath )               % 子文件夹下找后缀为.jpg的文件
% 
%     for j = 1 : length( image )
%         if( isequal( image( j ).name, '.' )||...
%             isequal( image( j ).name, '..'))             
%             continue;
%         end
%         datpath = fullfile( maindir, subdir( i ).name, image( j ).name);
%         % 此处添加你的对文件读写操作 %   
%         %movefile('1.txt', '11.txt');  % 把1.txt剪切成11.txt(1.txt不存在了)，实际上相当于改名
%         %copyfile('2.txt', '22.txt');  % 把2.txt复制成22.txt(2.txt依然存在) 
%         % movefile('11.txt', '1');      % 把11.txt剪切到文件夹1中
%         copyfile(datpath, '/var/autofs/home/home/lc408/cub_bird/CUB_200_2011/CUB_200_2011/allimages');      % 把22.txt复制到文件夹2中
%     end
% end




