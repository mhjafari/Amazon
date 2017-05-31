import numpy as np
from PIL import Image

for i in range(40479):
    address = '../train-jpg/train_'+str(i)+'.jpg'
    image = Image.open(address)
    image = image.convert('RGB')
    image.save('JPEG/train_'+str(i)+'.jpg','JPEG')
    image.close()
    if i % 100 == 0:
        print(i)
