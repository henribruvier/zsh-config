

# Check if running on macOS, otherwise stop here
[[ ! "x$SYSTEM" == "xDarwin" ]] && return

# /etc/zprofile is loaded and invokes
# /usr/libexec/path_helper that might slow down start-up.
# Better enter directly the content of /etc/paths.d here

# /etc/paths.d/40-XQuartz
export PATH=$PATH:/opt/X11/bin

export PATH=$PATH:/sbin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/opt/homebrew/bin
export PATH=$PATH:/opt/homebrew/sbin

# /etc/paths.d/MacGPG2
export PATH=$PATH:/usr/local/MacGPG2/bin

# GNU Core Utils
# brew info coreutils
export PATH=/usr/local/opt/coreutils/libexec/gnubin:$HOME/usr/local/opt/coreutils/libexec/gnubin:$PATH


