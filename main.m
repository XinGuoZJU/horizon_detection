clear
close all

dataset_name = 'YUD';
if strcmp(dataset_name, 'YUD')
    datapath = '/n/fs/vl/xg5/Datasets/YUD/YorkUrbanDB';
    savepath = 'dataset/YUD/output';
    img_type = 'jpg';
elseif strcmp(dataset_name, 'scannet')
    datapath = '/n/fs/vl/xg5/Datasets/neurodata/scannet-vp';
    savepath = 'dataset/scannet-vp/output';
    img_type = 'png';
end


dirs = dir(datapath);
for i = 3:size(dirs,1)
    dir_name = dirs(i).name;
    dirpath = [datapath, '/', dir_name];
    if isdir(dirpath)
        image_list = dir([dirpath, '/*.', img_type]); % struct
        for j = 1: size(image_list, 1)
            img_name = image_list(j).name;
            image_name = [dirpath, '/', img_name];

            %save_img_dir = strsplit(img_name, '.'); % cell
            %save_path = [savepath, '/', dir_name, '/', save_img_dir{1}];
            %save_path
            h = horizon_detection(image_name, savepath);
        end
    end
end


