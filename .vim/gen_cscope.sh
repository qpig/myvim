#! /bin/bash
#path=`pwd`
data_path=$HOME/.vim

echo generate cscope.out
find $path -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.hpp" -o -name "*.java" > $HOME/.vim/cscope.files
sudo cscope -bk -i $HOME/.vim/cscope.files
mv -f cscope.* $data_path

#ctags --c-kinds=+p --fields=+S -R /usr/include/
echo generate tags
sudo ctags -R --c-kinds=+p --c++-kinds=+p --fields=+iaS --extra=+q $path
mv -f tags $HOME/.vim/tags
