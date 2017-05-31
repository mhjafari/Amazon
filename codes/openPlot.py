import sys

sys.path.append('../train-tif-v2')
sys.path.append('../train-jpg')

#import os
#import gc
#import numpy as np
#import pandas as pd
#import seaborn as sns
#import tensorflow as tf
#import matplotlib.pyplot as plt
#import matplotlib.image as mpimg
#from skimage import io
from PIL import Image
import cv2


img = Image.open('../train-jpg/train_0.jpg')
img.show()
