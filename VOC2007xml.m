%CSDN:http://blog.csdn.net/sinat_30071459
%%
clc;
clear;
imgpath='VOC2007/allimages/';
traintxtpath='trainbbox.txt';
testtxtpath='testbbox.txt';
xmlpath_new='VOC2007/Annotations/';
foldername='VOC2007';


fidin=fopen(traintxtpath,'r');
lastname='begin';
i=0;
% while ~feof(fidin)
%      i=i+1;
%      
%      tline=fgetl(fidin);
%      str = regexp(tline, ' ','split');
%      filepath=[imgpath,str{1}];
%      img=imread(filepath);
%      [h,w,d]=size(img);
%       %imshow(img);
%       %rectangle('Position',[str2double(str{3}),str2double(str{4}),str2double(str{5})-str2double(str{3}),str2double(str{6})-str2double(str{4})],'LineWidth',4,'EdgeColor','r');
%       %pause(0.1);
%       
%         if strcmp(str{1},lastname)%
%            object_node=Createnode.createElement('object');
%            Root.appendChild(object_node);
%            node=Createnode.createElement('name');
%            node.appendChild(Createnode.createTextNode(sprintf('%s',str{2})));
%            object_node.appendChild(node);
%           
%            node=Createnode.createElement('pose');
%            node.appendChild(Createnode.createTextNode(sprintf('%s','Unspecified')));
%            object_node.appendChild(node);
%           
%            node=Createnode.createElement('truncated');
%            node.appendChild(Createnode.createTextNode(sprintf('%s','0')));
%            object_node.appendChild(node);
% 
%            node=Createnode.createElement('difficult');
%            node.appendChild(Createnode.createTextNode(sprintf('%s','0')));
%            object_node.appendChild(node);
%           
%            bndbox_node=Createnode.createElement('bndbox');
%            object_node.appendChild(bndbox_node);
% 
%            node=Createnode.createElement('xmin');
%            node.appendChild(Createnode.createTextNode(sprintf('%s',num2str(str{3}))));
%            bndbox_node.appendChild(node);
% 
%            node=Createnode.createElement('ymin');
%            node.appendChild(Createnode.createTextNode(sprintf('%s',num2str(str{4}))));
%            bndbox_node.appendChild(node);
% 
%            node=Createnode.createElement('xmax');
%            node.appendChild(Createnode.createTextNode(sprintf('%s',num2str(str{5}))));
%            bndbox_node.appendChild(node);
% 
%            node=Createnode.createElement('ymax');
%            node.appendChild(Createnode.createTextNode(sprintf('%s',num2str(str{6}))));
%            bndbox_node.appendChild(node);
%         else %xml
%            copyfile(filepath, 'JPEGImages');
%             %xml
%            if exist('Createnode','var')
%               tempname=lastname;
%               tempname=strrep(tempname,'.jpg','.xml');
%               xmlwrite(tempname,Createnode);   
%            end
%             
%             
%             Createnode=com.mathworks.xml.XMLUtils.createDocument('annotation');
%             Root=Createnode.getDocumentElement;%
%             node=Createnode.createElement('folder');
%             node.appendChild(Createnode.createTextNode(sprintf('%s',foldername)));
%             Root.appendChild(node);
%             node=Createnode.createElement('filename');
%             node.appendChild(Createnode.createTextNode(sprintf('%s',str{1})));
%             Root.appendChild(node);
%             source_node=Createnode.createElement('source');
%             Root.appendChild(source_node);
%             node=Createnode.createElement('database');
%             node.appendChild(Createnode.createTextNode(sprintf('My Database')));
%             source_node.appendChild(node);
%             node=Createnode.createElement('annotation');
%             node.appendChild(Createnode.createTextNode(sprintf('VOC2007')));
%             source_node.appendChild(node);
% 
%            node=Createnode.createElement('image');
%            node.appendChild(Createnode.createTextNode(sprintf('flickr')));
%            source_node.appendChild(node);
% 
%            node=Createnode.createElement('flickrid');
%            node.appendChild(Createnode.createTextNode(sprintf(num2str(i))));
%            source_node.appendChild(node);
%            owner_node=Createnode.createElement('owner');
%            Root.appendChild(owner_node);
%            node=Createnode.createElement('flickrid');
%            node.appendChild(Createnode.createTextNode(sprintf(num2str(i))));
%            owner_node.appendChild(node);
% 
%            node=Createnode.createElement('name');
%            node.appendChild(Createnode.createTextNode(sprintf('xiaoxianyu')));
%            owner_node.appendChild(node);
%            size_node=Createnode.createElement('size');
%            Root.appendChild(size_node);
% 
%           node=Createnode.createElement('width');
%           node.appendChild(Createnode.createTextNode(sprintf('%s',num2str(w))));
%           size_node.appendChild(node);
% 
%           node=Createnode.createElement('height');
%           node.appendChild(Createnode.createTextNode(sprintf('%s',num2str(h))));
%           size_node.appendChild(node);
% 
%          node=Createnode.createElement('depth');
%          node.appendChild(Createnode.createTextNode(sprintf('%s',num2str(d))));
%          size_node.appendChild(node);
%          
%           node=Createnode.createElement('segmented');
%           node.appendChild(Createnode.createTextNode(sprintf('%s','0')));
%           Root.appendChild(node);
%           object_node=Createnode.createElement('object');
%           Root.appendChild(object_node);
%           node=Createnode.createElement('name');
%           node.appendChild(Createnode.createTextNode(sprintf('%s',str{2})));
%           object_node.appendChild(node);
%           
%           node=Createnode.createElement('pose');
%           node.appendChild(Createnode.createTextNode(sprintf('%s','Unspecified')));
%           object_node.appendChild(node);
%           
%           node=Createnode.createElement('truncated');
%           node.appendChild(Createnode.createTextNode(sprintf('%s','0')));
%           object_node.appendChild(node);
% 
%           node=Createnode.createElement('difficult');
%           node.appendChild(Createnode.createTextNode(sprintf('%s','0')));
%           object_node.appendChild(node);
%           
%           bndbox_node=Createnode.createElement('bndbox');
%           object_node.appendChild(bndbox_node);
% 
%          node=Createnode.createElement('xmin');
%          node.appendChild(Createnode.createTextNode(sprintf('%s',num2str(str{3}))));
%          bndbox_node.appendChild(node);
% 
%          node=Createnode.createElement('ymin');
%          node.appendChild(Createnode.createTextNode(sprintf('%s',num2str(str{4}))));
%          bndbox_node.appendChild(node);
% 
%         node=Createnode.createElement('xmax');
%         node.appendChild(Createnode.createTextNode(sprintf('%s',num2str(str{5}))));
%         bndbox_node.appendChild(node);
% 
%         node=Createnode.createElement('ymax');
%         node.appendChild(Createnode.createTextNode(sprintf('%s',num2str(str{6}))));
%         bndbox_node.appendChild(node);
%        
%        lastname=str{1};
%         end
%         %
%         if feof(fidin)
%             tempname=lastname;
%             tempname=strrep(tempname,'.jpg','.xml');
%             xmlwrite(tempname,Createnode);
%         end
% end
% fclose(fidin);

file=dir(pwd);
for i=1:length(file)
   if length(file(i).name)>=4 && strcmp(file(i).name(end-3:end),'.xml')
    fold=fopen(file(i).name,'r');
    fnew=fopen([xmlpath_new file(i).name],'w');
    line=1;
    while ~feof(fold)
        tline=fgetl(fold);
        if line==1
           line=2;
           continue;
        end
        expression = '   ';
        replace=char(9);
        newStr=regexprep(tline,expression,replace);
        fprintf(fnew,'%s\n',newStr);
    end
    fprintf('%s\n',file(i).name);
    fclose(fold);
    fclose(fnew);
	delete(file(i).name);
   end
end
