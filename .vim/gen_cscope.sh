#! /bin/bash
PATHS=( \
# 	/home/pig/workspace/seserver/branches/SEServer_ForRefactor \
	/home/pig/workspace/memcached-1.4.15 \
 	/home/pig/workspace/seserver/trunk \
	)
data_path=$HOME/.vim

echo generate cscope.out
rm $data_path/cscope.files -f
for index in ${!PATHS[*]}
do
	path=${PATHS[index]}
	echo find $path
	find $path -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.hpp" -o -name "*.java" >> $data_path/cscope.files
done
sudo cscope -bk -i $data_path/cscope.files
mv -f cscope.* $data_path

echo generate tags
sudo ctags -R --c-kinds=+p --c++-kinds=+p --fields=+iaS --extra=+q -L $data_path/cscope.files
mv -f tags $data_path

echo generate TAGS
sudo cat $data_path/cscope.files | xargs etags --language=c++ --language=c -
mv -f TAGS $data_path
exit 0

