#!/bin/bash


# $1 - username

sudo usermod -aG tss $1
tpm2_ptool init
