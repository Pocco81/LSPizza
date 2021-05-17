#!/bin/bash


function fn_exists() { declare -F "$1" > /dev/null; }

function get_platform() {
    case "$(uname -s)" in
        Linux*)     platform=Linux;;
        Darwin*)    platform=Mac;;
        CYGWIN*)    platform=Cygwin;;
        MINGW*)     platform=MinGw;;
        *)          platform="UNKNOWN:${unameOut}"
    esac
    echo $platform
}

