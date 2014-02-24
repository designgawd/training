#!/bin/sh

echo "Please enter NEW program acronym"
read first

if [ -n "$first" ]
then
    echo "Will there be an email collector for this project? (y/n)"
    read second
else
    echo "You're an idiot! Enter a fucking program acronym (This statement approved by Gru)"
    exit
fi

ROOTPATH=/text/us/products/programs
TOPFOLDER=display
UPSELLFOLDER=upsell

mkdir $first
mkdir $first/$TOPFOLDER
mkdir $first/$TOPFOLDER/common
mkdir $first/$TOPFOLDER/common/css
mkdir $first/$TOPFOLDER/common/scss
mkdir $first/$TOPFOLDER/common/js
mkdir $first/$TOPFOLDER/common/json
mkdir $first/$TOPFOLDER/common/templates
mkdir $first/$TOPFOLDER/common/theme
echo "//Global Project Theme File" > $first/$TOPFOLDER/common/theme/theme.scss
echo "@import '/text/styles/reset/reset.css'; @import '../../../../../../common/sassMixins/sassMixins';" >> $first/$TOPFOLDER/common/theme/theme.scss
mkdir $first/$TOPFOLDER/control
mkdir $first/$TOPFOLDER/[media]

if [ $second == "y" ] || [ $second == "Y" ]
then
    mkdir $first/$TOPFOLDER/emailcollector
fi

mkdir $first/$TOPFOLDER/test
mkdir $first/$UPSELLFOLDER







