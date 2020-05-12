# SecondRealityISR
upscaling Second Reality demo from 320x200 to UHD(3840x2160)

Upscaled using  ISR (Image-Super-Resolution) trained neural networks, by Francesco Cardinale, available at [github.com/idealo/image-super-resolution](https://github.com/idealo/image-super-resolution)
Both RDN and RRDN networks used. 
On the first step 320x200 images upscaled to 640x480 with noise cancelling and edge antialiasing.
Second step from 640x480 to 2560x2320 RRDN network used with GANS model.
16x9 widescreen crop made on the last step in video editor.

#Intermission arts upscale looks amazing:
![01 Original](https://github.com/demoded/SecondRealityISR/blob/master/01-original.png?raw=true)
![01 Upscaled](https://github.com/demoded/SecondRealityISR/blob/master/01-upscaled.png?raw=true)
![02 Original](https://github.com/demoded/SecondRealityISR/blob/master/02-original.png?raw=true)
![02 Upscaled](https://github.com/demoded/SecondRealityISR/blob/master/02-upscaled.png?raw=true)

#Although not all polygon edges antialiased good
![03 Original](https://github.com/demoded/SecondRealityISR/blob/master/03-original.png?raw=true)
![03 Upscaled](https://github.com/demoded/SecondRealityISR/blob/master/03-upscaled.png?raw=true)
