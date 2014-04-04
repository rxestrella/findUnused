files=( $(find . -type f | grep -E ".+(gif|png|jpeg|jpg)"| awk -F/ '{print$NF}' ) )
for file in ${files[@]}
do
    echo $file
done

dirs=( $(find . -type d ) )
for directory in ${dirs[@]}
do
    echo $directory
done

texts=( $(find . -type f | grep -E ".+(txt|cpp|py|html|xml|json)" | awk -F/ '{print$NF}' ) )
for text in ${texts[@]}
do
    echo $text
done
for directory in ${dirs[@]}
do
    
    for text in ${texts[@]}
    do
	for file in ${files[@]}
	do
	    cat $directory/$text
	    grep $file
	    echo $?
	done
    done
done

