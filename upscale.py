## https://github.com/idealo/image-super-resolution

import os
import numpy as np
from PIL import Image
from ISR.models import RDN
from ISR.models import RRDN
#rdn = RDN(weights='psnr-large')
#rdn_sm = RDN(weights='psnr-small')
rdn_nr = RDN(weights='noise-cancel')
rrdn= RRDN(weights='gans')

START = 34001
END = 35000

#shortened 
#i0010427.png - i0010511.png
#i0011357.png - i0011406.png
#i0013204.png - i0013262.png
#i0013309.png - i0013707.png
#i0013810.png - i0014096.png
#i0015870.png - i0016231.png
#i0018560.png - i0018651.png
#i0020861.png - i0020904.png
#i0022620.png - i0022714.png
#i0024923.png - i0025433.png
#i0028315.png - i0028383.png
#i0029318.png - i0029391.png
#i0032648.png - i0032962.png
#i0033099.png - i0033296.png
#i0033414.png - i0033613.png
#i0033729.png - i0033929.png
#i0034042.png - i0034242.png
#i0034356.png - i0034556.png
#i0034670.png - i0034870.png
#i0034984.png - i0035184.png
#i0035298.png - i0035498.png
#i0035612.png - i0035812.png
#i0035927.png - i0036127.png
#i0036241.png - i0036441.png
#i0036556.png - i0036757.png
#i0036870.png - i0037070.png
#i0037184.png - i0037384.png
#i0037499.png - i0037699.png
#i0037813.png - i0038013.png
#i0038127.png - i0038328.png
#i0038441.png - i0038641.png
#i0038755.png - i0038955.png
#i0039069.png - i0039269.png
#i0039383.png - i0039583.png



def upscale(fileName):
    outPath='out/'
    pathFileName = outPath+fileName

    img = Image.open(fileName)
    lr_img = np.array(img)

    ##LR to SR 640x480 NOISE CANCEL
    sr_img_nr = rdn_nr.predict(lr_img)
    #out = Image.fromarray(sr_img_nr)
    #out.save(pathFileName+'-noiceCancel' + '.png')
    #print(pathFileName+'-noiceCancel' + '.png DONE')

    ##SR-Small to HR 1920p GANS
    hr_img = rrdn.predict(sr_img_nr)
    out = Image.fromarray(hr_img)
    out.save(pathFileName)

counter = 0

files = os.listdir('./')
for fileName in files:
    counter = counter + 1

    if counter < START:
        continue

    print('Processing [' + str(counter) + '] ' + fileName)
    upscale(fileName)

    if counter == END:
        break

