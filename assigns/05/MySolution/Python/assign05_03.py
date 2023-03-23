####################################################
#!/usr/bin/env python3
####################################################
import sys


sys.path.append('./../../../05')
sys.path.append('./../../../../mypylib')
from mypylib_cls import *
####################################################
"""
HX-2023-03-14: 30 points
BU CAS CS320-2023-Spring: Image Processing
"""
####################################################
import math
####################################################
import kervec
from kervec import kernel_ifoldleft, kernel
import imgvec
####################################################
from PIL import Image
####################################################

def load_color_image(filename):
    """
    Loads a color image from the given file and returns a dictionary
    representing that image.

    Invoked as, for example:
       i = load_color_image("test_images/cat.png")
    """
    with open(filename, "rb") as img_handle:
        img = Image.open(img_handle)
        img = img.convert("RGB")  # in case we were given a greyscale image
        img_data = img.getdata()
        pixels = list(img_data)
        width, height = img.size
        return imgvec.image(height, width, pixels)
    # return None

def save_color_image(image, filename, mode="PNG"):
    """
    Saves the given color image to disk or to a file-like object.  If filename
    is given as a string, the file type will be inferred from the given name.
    If filename is given as a file-like object, the file type will be
    determined by the "mode" parameter.
    """
    out = Image.new(mode="RGB", size=(image.width, image.height))
    out.putdata(image.pixlst)
    if isinstance(filename, str):
        out.save(filename)
    else:
        out.save(filename, mode)
    out.close()
    # return None

####################################################
#
# HX-2023-03-18:
# This one is incorrect:
# def grey_of_color(clr):
#     (r0, b1, g2) = clr
#     return round(0.299*r0+0.587*b1+0.114*g2)


def grey_of_color(clr):
    (rr, gg, bb) = clr
    return round(0.299*rr+0.587*gg+0.114*bb)
#
####################################################

def image_invert_grey(ximg):
    return imgvec.image_make_map(ximg, lambda pix: 255 - pix)
def image_invert_color(ximg):
    return imgvec.image_make_map(ximg, lambda clr: 255 - grey_of_color(clr))

####################################################
#
# towers = \
#     load_color_image("INPUT/towers.jpg")
# balloons = load_color_image("INPUT/balloons.png")
#print(balloons.pixlst)
#
####################################################
#
# save_color_image(image_invert_color(towers), "OUTPUT/towers_invert.png")
# save_color_image(image_invert_color(balloons), "OUTPUT/balloons_invert.png")
#
####################################################

def image_edges_grey(image):
    """
    This is an implementation of the Sobel operator.
    """
    krow = \
        kervec.kernel_make_pylist\
        (3, [-1, -2, -1, 0, 0, 0, 1, 2, 1])
    kcol = \
        kervec.kernel_make_pylist\
        (3, [-1, 0, 1, -2, 0, 2, -1, 0, 1])
    imgrow = \
        imgvec.image_kernel_correlate(image, krow, 'extend')
    imgcol = \
        imgvec.image_kernel_correlate(image, kcol, 'extend')
    imgres = \
        imgvec.image_make_z2map\
        (imgrow, imgcol, lambda x, y: math.sqrt(x*x + y*y))
    return imgvec.image_round_and_clip(imgres)

def image_edges_color(image):
    return image_edges_grey\
        (imgvec.image_make_map(image, lambda clr: 255 - grey_of_color(clr)))

####################################################

def image_blur_bbehav_grey(image, ksize, bbehav):
    ksize2 = ksize*ksize
    kernel = \
        kervec.kernel_make_pylist\
        (ksize, ksize2*[1.0/ksize2])
    return imgvec.image_round_and_clip\
        (imgvec.image_kernel_correlate(image, kernel, bbehav))

####################################################

def color_filter_from_greyscale_filter(filt):
    """
    Given a filter that takes a greyscale image as input and produces a
    greyscale image as output, returns a function that takes a color image as
    input and produces the filtered color image.
    """
    def image_filter(cimage):
        ww = cimage.width
        hh = cimage.height
        image0 = filt(imgvec.image_make_map(cimage, lambda clr: clr[0]))
        image1 = filt(imgvec.image_make_map(cimage, lambda clr: clr[1]))
        image2 = filt(imgvec.image_make_map(cimage, lambda clr: clr[2]))
        return imgvec.image_make_tuple\
            (hh, ww, \
             tuple(zip(image0.pixlst, image1.pixlst, image2.pixlst)))
    return lambda cimage: image_filter(cimage)

####################################################

def image_blur_bbehav_color(image, ksize, bbehav):
    return \
        color_filter_from_greyscale_filter\
        (lambda image: image_blur_bbehav_grey(image, ksize, bbehav))(image)

####################################################
#save_color_image(image_blur_bbehav_color(balloons, 5, 'extend'), "OUTPUT/balloons_blurred.png")
####################################################

def image_seam_carving_color(image, ncol):
    """
    Starting from the given image, use the seam carving technique to remove
    ncols (an integer) columns from the image. Returns a new image.
    """
   
    
    assert ncol < image.width
    energy = image_edges_color(image)
    hh = image.height
    ww = image.width
    print(hh,ww)
    

    def available_neighbours(idx):
        return int1_foldleft(3, [], \
                        lambda r0, x0: 
                            r0 +[x0-1] if (ww >(idx%ww + x0-1)>= 0) else r0)
    def min_neighbour(idx, r0): 
        #print(available_neighbours(idx))
        max_tuple =  pylist_foldleft(
                        available_neighbours(idx),
                        [999999999, -1], 
                        lambda r1, x1: 
                            [r0[(x1 + idx) % ww][0] ,(x1+idx)% ww] if r0[(x1 + idx) % ww][0] < r1[0] else r1)
        return max_tuple[1]
    def update_energy(idx, r0, x0):
        # if idx!= 0 and idx % ww == 0:
        #     print(idx)
        #     print(r0)
        #     assert False
        curr = min_neighbour(idx, r0[0])
        #print(idx, curr)
        r0[1][idx % ww] = [
            r0[0][curr][0] + x0,
            r0[0][curr][1] + [idx]
        ]
        if idx % ww == ww-1:
            r0[0] = r0[1]
        return r0

    ini = int1_foldleft(ww, [], lambda r0, x0: r0+[[0,[]]])
    energy_kernel = kernel(ww*hh, energy.pixlst)

    res = kernel_ifoldleft(energy_kernel, [ini, ini], lambda r0, idx, x0: 
                update_energy(idx, r0, x0) 
            )
    print(res[0][-1])
    #print(energy.pixlst[-3:])
    

####################################################
# save_color_image(image_seam_carving_color(balloons, 100), "OUTPUT/balloons_seam_carving_100.png")
####################################################

"""
154499, 154999, 155499, 155999, 156499
def min_path(r, c, r0):
    
        index = ww*r+c
        
        min_way = energy.pixlst[index]
        min_pos = index
        if c > 0 and energy.pixlst[index-1] < min_way:
            min_way = energy.pixlst[index-1]
            min_pos = index-1
        if c < ww-2 and energy.pixlst[index+1] < min_way:
            min_way = energy.pixlst[index+1]
            min_pos = index+1
        
        r0[c] = [r0[c][0]+min_way, r0[c][1]+[min_pos]]
        return r0

int1_foldleft(hh -1, initial_energy, lambda r0, r:
                   int1_foldleft(ww, r0, lambda r1, c:
                                 min_path(r+1, c, r1)))
"""

balloons = load_color_image("INPUT/balloons.png")
print("height", balloons.height, "width",balloons.width)
print(len(balloons.pixlst))
image_seam_carving_color(balloons,0)