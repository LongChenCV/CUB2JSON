# CUB2JSON
Convert CUB dataset to JSON dataset
目标：将txt制作json数据集

1 CUB_200_2011制作train/test.txt(训练和测试数据集名字)和trainbbox/testbbox.txt(bounding boxes信息)：cub_bird/CUB_200_2011/creat_traintest_txt.m,生成包含bbox信息的trainbbox.txt和testbbox.txt,移动到cub_bird/VOC2007文件夹下。同时生成只有训练或测试图片名字的trainval.txt和test.txt放到VOC2007文件夹下Main文件里的trainval.txt和test.txt替换。

2 转成xml文件：cub_bird/VOC2007/VOC2007xml.m

3 xml转json：进入MatlabAPI

mex('CXXFLAGS=\$CXXFLAGS -std=c++11 -Wall','-largeArrayDims',...
    'private/gasonMex.cpp','../common/gason.cpp',...
     '-I../common/','-outdir','private');
CocoUtils.convertPascalGt( 'detectron/dataset', '2007', 'trainval', '/home/duan/chenlong/detectron/dataset/pascal_trainval2007.json')
CocoUtils.convertPascalGt( 'detectron/dataset', '2007', 'test', '/home/duan/chenlong/detectron/dataset/pascal_test2007.json')
