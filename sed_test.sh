#!/bin/sh
var="Day's Auto / Boat Sales & Service"
#replace="-"
#echo ${var// & /$replace}
var=$(echo $var | sed -e "s=&==g")
var=$(echo $var | sed -e "s= =-=g")
var=$(echo $var | sed -e "s=/==g")
var=$(echo $var | sed -e "s='==g")
var=$(echo $var | sed -e "s=--=-=g")


echo $var
