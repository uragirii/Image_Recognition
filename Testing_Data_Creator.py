""""
This file is part of the project IMGRG.
PS check log.txt for more details.

A python 3.6 program to just gather the pixels of the Grayscale Images and convert them to pixels and store them in [IMGRG_testdata.txt].
"""
# All the files to be imported:
from PIL import Image
import os
import sys

def show_percentage(x):
    sys.stdout.flush()
    sys.stdout.write("\rPecentage Completed: %d" %x)


def del_file(target,name):
    """
     This function checks and deletes if the file exists before or not.
     Input: The target and name of the file.
     Output: Voids
    """
    if not os.path.exists(target):
        return None
    else:
        print("Removing the existing file")
        os.remove(name)

def write_data(file_names,y,file_path):
    """"
    This is the most important function of this file.
    Inputs : Accepts the {file_name} which is the list of the names of the files in a particular folder.
           : Accepts the {y} which tells what is the value of the digit. y E {1,2,3,4,5,6,7,8,9}.
           : Accepts the {file_path} which tells where the image is located.
    Output : Void.
    """
    count = 0
    for file in file_names:
        count = count+1
        temp_mypath = file_path+'\\'+file
        im = Image.open(temp_mypath)
        pixels = list(im.getdata())
        fh = open('IMGRG_testdata.txt','a')
        for t in pixels:
            fh.write(str(t))
            fh.write(',')
        fh.write(str(i))
        fh.write('\n')
        fh.close()
        show_percentage(count * 100 / len(file_names))


IMGRG_path = r'E:\Codes\AI\My Projects\Image Recognition\Final\IMGRG_data.txt'
IMRG_data = r"IMGRG_testdata.txt"

mypath = r'E:\Codes\AI\My Projects\Image Recognition\Final\Testing data'

del_file(IMGRG_path,IMRG_data)
for i in range(1,10):
    print("\nCreating data of digit", i)
    temp_file_names = []
    temp_mypath = mypath + '\\'+ str(i)
    for (dirpath, dirnames, filenames) in os.walk(temp_mypath):
        temp_file_names.extend(filenames)
    write_data(temp_file_names,i,temp_mypath)
print("Data has been created in the file [IMGRG_testdata.txt]")
