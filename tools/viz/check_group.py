import os
import json
from skimage import io
import numpy as np
import matplotlib.pyplot as plt


def imshow(im):
    plt.close()
    sizes = im.shape
    height = float(sizes[0])
    width = float(sizes[1])

    fig = plt.figure()
    fig.set_size_inches(width / height, 1, forward=False)
    ax = plt.Axes(fig, [0.0, 0.0, 1.0, 1.0])
    ax.set_axis_off()
    fig.add_axes(ax)
    plt.xlim([-0.5, sizes[1] - 0.5])
    plt.ylim([sizes[0] - 0.5, -0.5])
    plt.imshow(im)


if __name__ == '__main__':
    data_name  = 'SUNCG'  # 'YUD', 'ScanNet', 'SceneCityUrban3D', 'SUNCG'
    if data_name == 'YUD':
        image_path = '/n/fs/vl/xg5/Datasets/YUD/YorkUrbanDB'
    elif data_name == 'ScanNet':
        image_path = '/n/fs/vl/xg5/Datasets/ScanNet/scannet-vp'
    elif data_name == 'SceneCityUrban3D':
        image_path = '/n/fs/vl/xg5/Datasets/SceneCityUrban3D/su3'
    elif data_name == 'SUNCG':
        image_path = '/n/fs/vl/xg5/Datasets/SUNCG/mlt_v2'

    org_path = '/n/fs/vl/xg5/workspace/baseline/horizon_detection/dataset/' + data_name + '/data/data.json'
    save_path = '/n/fs/vl/xg5/workspace/baseline/horizon_detection/dataset/' + data_name + '/viz_group'
    
    with open(org_path, 'r') as f:
        org_lines = f.readlines()
        for num, context in enumerate(org_lines):
            print(num)
            data_dict = json.loads(context)
            group = np.array(data_dict['group']).tolist()
            org_line = np.array(data_dict['org_line']).tolist()

            image_dir = data_dict['image_path']
            image_name = os.path.join(image_path, image_dir)
            image = io.imread(image_name).astype(float) / 255

            img_dir = image_name.split('/')[-2]
            savepath = os.path.join(save_path, img_dir)
            os.makedirs(savepath, exist_ok=True)
            save_name = os.path.join(save_path, image_dir)

            color_list = ['y', 'b', 'm', 'k', 'r', 'c', 'g', 'w']
            # draw

            imshow(image)
            for i in range(len(org_line)):
                g = int(group[i])
                if g == -1:  # it is not necessary in this code
                    color = 'k--'
                else:
                    color = color_list[g]

                a, b = org_line[i]
                plt.plot([a[1], b[1]], [a[0], b[0]], color, linewidth=0.5)
                plt.scatter(a[1], a[0], c='#33FFFF', s=1.2)
                plt.scatter(b[1], b[0], c='#33FFFF', s=1.2)

            plt.savefig(save_name, dpi=500, bbox_inches=0)


