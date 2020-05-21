###############################scales gtk3
export GDK_SCALE=2 
#do not scale fonts
export GDK_DPI_SCALE=0.5

export QT_AUTO_SCREEN_SCALE_FACTOR=1

export ELM_SCALE=1.5

XDG_CONFIG_HOME="$HOME/.config"
export XDG_CONFIG_HOME

##################ANDROID###############################

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools


##############################################################################

# if command not found sugest package from repo
#	source /usr/share/doc/pkgfile/command-not-found.bash

# export /bin to path
export PATH=$PATH:$HOME/bin

# ruby
export PATH=$PATH:$HOME/.gem/ruby/2.7.0/bin/

# better yaourt colors
export YAOURT_COLORS="nb=1:pkg=1:ver=1;32:lver=1;45:installed=1;42:grp=1;34:od=1;41;5:votes=1;44:dsc=0:other=1;35"
