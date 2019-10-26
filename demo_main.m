image_path = 'demo_data/imgs';
out_dir = 'demo_data/output';

image_list = dir([image_path, '/*.jpg']);
for j = 1: size(image_list, 1)
    img_name = image_list(j).name;
    image_name = [image_path, '/', img_name];
    h = horizon_detection(image_name, out_dir);
end

