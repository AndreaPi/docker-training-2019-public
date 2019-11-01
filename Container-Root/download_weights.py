import keras
import numpy as np
import os
from requests import get 
from tqdm import tqdm

# download weights for the ResNet50 model 
keras.applications.resnet50.ResNet50(weights='imagenet')

# download file with a progress bar
def download(url, file_name):
    # get request
    r = get(url, stream=True)
    total_size = int(r.headers.get('content-length'))
    unit_size = 1024
    block_size = unit_size*32
    # open in binary mode
    with open(file_name, 'wb') as f: 
        with tqdm(total=np.ceil(total_size // block_size), \
                  unit='B', unit_scale=True, unit_divisor=unit_size) as pbar: 
            for data in r.iter_content(block_size): 
                f.write(data)
                pbar.update(len(data))

# download weights for the keras_retinanet model            
url = "https://github.com/fizyr/keras-retinanet/releases/download/0.5.1/resnet50_coco_best_v2.1.0.h5"
model_path = os.path.join('/snapshots', 'resnet50_coco_best_v2.1.0.h5')
download(url, model_path)