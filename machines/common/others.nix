{ config, pkgs, ... }:

#
# Other packages that I've installed, but not sure if I'll keep them
#

{
# List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    # Stuff I'm trying
    abook # address book
    acpi # show battery status and plus
    cypress # in-browser testing
    docker-compose # multi-container orchestration for docker


#* nixos.antimony (antimony)
#  A computer-aided design (CAD) tool from a parallel universe
antimony 

#* nixos.aqemu (aqemu)
#  A virtual machine manager GUI for qemu
# aqemu # TODO Marked as broken in 2021.05

#* nixos.audacity (audacity)
#  Sound editor with graphical UI
audacity 

#* nixos.blueman (blueman)
#  GTK-based Bluetooth Manager
blueman 

#* nixos.colordiff (colordiff)
#  Wrapper for 'diff' that produces the same output but with pretty 'syntax' highlighting
colordiff 

#* nixos.cypress (cypress)
#  Fast, easy and reliable testing for anything that runs in a browser
cypress 

#* nixos.dos2unix (dos2unix)
#  Convert text files with DOS or Mac line breaks to Unix line breaks and vice versa
dos2unix 

#* nixos.facedetect (facedetect)
#  A simple face detector for batch processing
facedetect 

#* nixos.fortune (fortune-mod)
#  A program that displays a pseudorandom message from a database of quotations
fortune 

#* nixos.freeciv (freeciv)
#  Multiplayer (or single player), turn-based strategy game
freeciv 

#* nixos.gifsicle (gifsicle)
#  Command-line tool for creating, editing, and getting information about GIF images and animations
gifsicle 

# Not using because pngout is not free, but keeping because I might want to use jpegoptim
#* nixos.image_optim (image_optim-0.26.3)
#  Command line tool and ruby interface to optimize (lossless compress, optionally lossy) jpeg, png, gif and svg images using external utilities (advpng, gifsicle, jhead, jpeg-recompress, jpegoptim, jpegrescan, jpegtran, optipng, pngcrush, pngout, pngquant, svgo)

#* nixos.gitlab-runner (gitlab-runner)
#  GitLab Runner the continuous integration executor of GitLab
gitlab-runner

#* nixos.gmpc (gmpc)
#  A GTK2 frontend for Music Player Daemon
gmpc 

#* nixos.gmtp (gmtp)
#  A simple MP3 and Media player client for UNIX and UNIX like systems.
gmtp 

#* nixos.gptfdisk (gptfdisk)
#  Set of text-mode partitioning tools for Globally Unique Identifier (GUID) Partition Table (GPT) disks
gptfdisk 

#* nixos.actdiag (actdiag-0.5.4)
#  Generate activity-diagram image from spec-text file (similar to Graphviz)
actdiag 

#* nixos.blockdiag (blockdiag-1.5.3)
#  Generate block-diagram image from spec-text file (similar to Graphviz)
blockdiag 

#* nixos.nwdiag (nwdiag-2.0.0)
#  Generate network-diagram image from spec-text file (similar to Graphviz)
nwdiag 

#* nixos.seqdiag (seqdiag-0.9.6)
#  Generate sequence-diagram image from spec-text file (similar to Graphviz)
seqdiag 

#* nixos.graphviz (graphviz)
#  Graph visualization tools
graphviz 

#* nixos.gtypist (gtypist)
#  Universal typing tutor
gtypist 

#* nixos.hexchat (hexchat)
#  A popular and easy to use graphical IRC (chat) client
hexchat 

#* nixos.inkscape (inkscape)
#  Vector graphics editor
inkscape 

#* nixos.jq (jq)
#  A lightweight and flexible command-line JSON processor
jq 

#* nixos.kicad (kicad)
#  Open Source Electronics Design Automation Suite
kicad 

#* nixos.mailutils (mailutils)
#  Rich and powerful protocol-independent mail framework
mailutils 

#* nixos.metasploit (metasploit-framework)
#  Metasploit Framework - a collection of exploits
metasploit 

#* nixos.guardian-agent (guardian-agent-0.7.2)
#  Secure ssh-agent forwarding for Mosh and SSH
guardian-agent

#* nixos.mosh (mosh)
#  Mobile shell (ssh replacement)
mosh 

#* nixos.nix-prefetch (nix-prefetch)
#  Prefetch any fetcher function call, e.g. package sources
nix

#* nixos.nmap (nmap-7.80)
#  A free and open source utility for network discovery and security auditing
nmap 

#* nixos.openjdk (openjdk-8u222-ga)
#  The open-source Java Development Kit
openjdk 

#* nixos.plantuml (plantuml-1.2020.0)
#  Draw UML diagrams using a simple and human readable text description
plantuml 

#* nixos.polybar (polybar-3.4.2)
#  A fast and easy-to-use tool for creating status bars
polybar 

#* nixos.pstree (pstree-2.39)
#  Show the set of running processes as a tree
pstree 

#* nixos.deluge (python2.7-deluge)
#  Torrent client
deluge 

#* nixos.qrcode (qrcode-git)
#  A small QR-code tool
qrcode 

#* nixos.simplescreenrecorder (simplescreenrecorder)
#  A screen recorder for Linux
simplescreenrecorder 

#* nixos.socat (socat)
#  A utility for bidirectional data transfer between two independent data channels
socat 

#* nixos.websocat (websocat)
#  Command-line client for WebSockets (like netcat/socat)
websocat 

#* nixos.datasette (datasette-0.39)
#  An instant JSON API for your SQLite databases
datasette 

#* nixos.sqlite (sqlite)
#  A self-contained, serverless, zero-configuration, transactional SQL database engine
sqlite 

#* nixos.ssdeep (ssdeep)
#  A program for calculating fuzzy hashes
ssdeep 

#* nixos.stellarium (stellarium)
#  Free open-source planetarium
stellarium 

#* nixos.stumpish (stumpish)
#  STUMPwm Interactive SHell
stumpish 

#* nixos.syncthing-cli (syncthing-cli)
#  Open Source Continuous File Synchronization
syncthing

#* nixos.syncthing-discovery (syncthing-discovery)
#  Open Source Continuous File Synchronization
syncthing

#* nixos.syncthing-relay (syncthing-relay)
#  Open Source Continuous File Synchronization
syncthing

#* nixos.syncthing-tray (syncthing-tray)
#  Simple application tray for syncthing
syncthing

#* nixos.ptask (ptask-1.0.0)
#  GTK-based GUI for taskwarrior
ptask 

#* nixos.tasknc (tasknc-2017-05-15)
#  A ncurses wrapper around taskwarrior
tasknc 

#* nixos.taskopen (taskopen-1.1.4)
#  Script for taking notes and open urls with taskwarrior
taskopen 

#* nixos.taskserver (taskserver-1.1.0)
#  Server for synchronising Taskwarrior clients
taskserver 

#* nixos.tasksh (tasksh-1.2.0)
#  REPL for taskwarrior
tasksh 

#* nixos.taskwarrior (taskwarrior)
#  Highly flexible command-line tool to manage TODO lists
taskwarrior 

#* nixos.warzone2100 (warzone2100)
#  A free RTS game, originally developed by Pumpkin Studios
warzone2100 

#* nixos.weechat (weechat-bin-env)
#  A fast, light and extensible chat client
weechat 

#* nixos.weka (weka)
#  Collection of machine learning algorithms for data mining tasks
weka 

#* nixos.xchm (xchm)
#  A viewer for Microsoft HTML Help files
xchm 

#* nixos.xclip (xclip)
#  Tool to access the X clipboard from a console application
xclip 



android-studio
arduino
avr8burnomat
borgbackup
clementine
dejagnu
discord

cl-launch
clasp
ecl
lispPackages.quicklisp

ffmpeg
fim
fritzing
gforth
gmpc
goldendict
handbrake
heroku
jdupes
jp2a
lmms
lxappearance
mediainfo
mopidy
mpd
mucommander
p7zip
samba
shellcheck
skim
st
steam
stow
teamviewer
termtosvg
travis
usbutils
viu

dosbox
wine
winetricks
xlayoutdisplay

  ];
}
