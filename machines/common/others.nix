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

#* nixos.cypress (cypress)
#  Fast, easy and reliable testing for anything that runs in a browser
cypress

#* nixos.facedetect (facedetect)
#  A simple face detector for batch processing
facedetect

#* nixos.fortune (fortune-mod)
#  A program that displays a pseudorandom message from a database of quotations
fortune

#* nixos.freeciv (freeciv)
#  Multiplayer (or single player), turn-based strategy game
freeciv

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

##################################
# Diagramming
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

#* nixos.plantuml (plantuml-1.2020.0)
#  Draw UML diagrams using a simple and human readable text description
plantuml

######################

#* nixos.gtypist (gtypist)
#  Universal typing tutor
gtypist

#* nixos.hexchat (hexchat)
#  A popular and easy to use graphical IRC (chat) client
hexchat

#* nixos.mailutils (mailutils)
#  Rich and powerful protocol-independent mail framework
mailutils

#* nixos.metasploit (metasploit-framework)
#  Metasploit Framework - a collection of exploits
# metasploit

#* nixos.guardian-agent (guardian-agent-0.7.2)
#  Secure ssh-agent forwarding for Mosh and SSH
guardian-agent

#* nixos.openjdk (openjdk-8u222-ga)
#  The open-source Java Development Kit
openjdk

#* nixos.polybar (polybar-3.4.2)
#  A fast and easy-to-use tool for creating status bars
polybar

#* nixos.pstree (pstree-2.39)
#  Show the set of running processes as a tree
pstree

#* nixos.qrcode (qrcode-git)
#  A small QR-code tool
qrcode

#* nixos.simplescreenrecorder (simplescreenrecorder)
#  A screen recorder for Linux

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

#* nixos.taskopen (taskopen-1.1.4)
#  Script for taking notes and open urls with taskwarrior
taskopen

#* nixos.taskserver (taskserver-1.1.0)
#  Server for synchronising Taskwarrior clients
taskserver

#* nixos.tasksh (tasksh-1.2.0)
#  REPL for taskwarrior
tasksh

#* nixos.warzone2100 (warzone2100)
#  A free RTS game, originally developed by Pumpkin Studios
warzone2100

#* nixos.weechat (weechat-bin-env)
#  A fast, light and extensible chat client
weechat

#* nixos.xchm (xchm)
#  A viewer for Microsoft HTML Help files
xchm


android-studio
arduino
avr8burnomat

borgbackup
clementine
dejagnu



fim
fritzing
gforth
gmpc

goldendict

heroku
jdupes
jp2a
lmms

mediainfo
mopidy
mpd
# mucommander # doesn't build on 22.05
p7zip
samba
shellcheck
skim
#steam
stow
teamviewer
termtosvg
travis
viu

dosbox
wine
winetricks
xlayoutdisplay

# Front-end for various command line archiving tools
xarchiver


# Utility to magnify, rotate and mirror section of the xscreen
# could be useful when editing media...
xzoom
  ];
}
