import os
import numpy as np
import nibabel as nib

def makeMap(mapCoords,dims,data):
    n = len(dims)
    m = 0
    tempTple = ()
    while n > m:
        tempTple = (tempTple+(0,))
        m += 1
    m = 0
    while n > m:
        #do stuff with temp tuple
        temp = data
        l = 0
        while n > l:
            temp = temp[tempTple[l]]
            l += 1

        if temp in mapCoords:
            mapCoords[temp].append(tempTple)# add coord to list
        else:
            mapCoords[temp] = list() #make list, it doesn't exiss:
            mapCoords[temp].append(tempTple)

        if tempTple[m] >= dims[m]:
            m += 1
        else:
            tempTple[m] += 1

def transform(dataFile,save_path):
    img = nib.load(dataFile)
    data = img.get_fdata()
    hdr = img.header
    mapCoords = dict()# hashmap to contain lists of 3-tuples

    #use specially design loop_rec function to go through data, Im not sure of another way
    # to set up something that could possible variable n array
    #first arguement is the number elements in data.shape() - 1, start at m=0 for second arg,
    #mapcoords is passed to store the values to, dims in the shape of the data, data is passed
    # () is an empty tuple, this is added to during each recursion 
    dims = data.shape()
    makeMap(mapCoords,dims,data) 

    for key in mapCoords:
        tList = mapCoords[key]
        tData = np.zeros(dims)#generate zeros
        s = str(key) + '_label.nii.gz'
        save_loc = os.path.join(save_path,s)
        for coord in tList:
            tData[coord[0],coord[1],coord[2]] = key #fix the coords to the correct value for this 'label'
        tImg = nib.Nifti1Image(tData,None,hdr)
        nib.save(tImg,save_loc)
    
