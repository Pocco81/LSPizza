#!/bin/bash



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

