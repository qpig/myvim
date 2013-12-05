#! /bin/bash
#path=`pwd`
path=/home/pig/memcached-1.4.15
data_path=$HOME/.vim

echo generate cscope.out
find $path -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.hpp" -o -name "*.java" > $data_path/cscope.files
sudo cscope -bk -i $data_path/cscope.files
mv -f cscope.* $data_path

#ctags --c-kinds=+p --fields=+S -R /usr/include/
echo generate tags
sudo ctags -R --c-kinds=+p --c++-kinds=+p --fields=+iaS --extra=+q $path
mv -f tags $data_path

echo generate TAGS
sudo cat $data_path/cscope.files | xargs etags -
mv -f TAGS $data_path
