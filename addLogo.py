import os
from dfpvizpy.dfpvizpy import append_images
from PIL import Image


def addLogo(fname,fnameOut,fac=1):
    #Create logo
    orig = Image.open(fname)
    width, height = orig.size

    logo = Image.open('dfp-line-logo-black.png')
    lwidth, lheight = logo.size
    lwidth = int(lwidth/fac)
    lheight = int(lheight/fac)
    logo.thumbnail((lwidth,lheight),Image.ANTIALIAS)
    new_im = Image.new('RGB', (width, lheight+10),color=(255,255,255))
    new_im.paste(logo,(width-lwidth-20,5),logo)
    images = [Image.open(fname), new_im]
    combined = append_images(images, direction='vertical')
    combined.save(fnameOut)

addLogo("ex_theme.png","ex_theme_logo.png",fac=3)
