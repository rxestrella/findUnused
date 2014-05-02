#!/bin/bash

files=( $(find . | grep -E ".+(gif|png|jpeg|jpg)" ) )

echo Image Files:
for file in ${files[@]}
do
    echo $file
done

dirs=( $(find . -type d ) )

echo Directories:
for directory in ${dirs[@]}
do
    echo $directory
done

texts=( $(find . | grep -E ".+(txt|cpp|py|html|xml|json)" ) )

echo Text Files:
for text in ${texts[@]}
do
    echo $text
done

echo RESULTS:
for text in ${texts[@]}
do
    for imageFile in ${files[@]}
    do
        # search just the basename of the file inside the text
        grep -q $(basename $imageFile) $text

	
	echo $?
        # TODO: If file is found, flag to not print
#	if [ $? == 0 ]; then
	if [ $? == 0 ]; then
	    $imageFile = true
	else
	    $imageFile = false
	fi
    done
    #TODO: Print the imageFile if it was NOT found in any of the text file
    
    for imageFile in ${files[@]}
    do
	if [ $imageFile != true ]; then
	    echo $imageFile
	fi
	
    done
    # if imageStillWasNotFound
    #   print imageFile
    
done
