#!/bin/bash
#
#  Artisan Application Runtime
#  ©2018-Present - SouthWinds Tech Ltd - www.southwinds.io
#  Licensed under the Apache License, Version 2.0 at http://www.apache.org/licenses/LICENSE-2.0
#
#  Contributors to this project, hereby assign copyright in this code to the project,
#  to be licensed under the same terms as the rest of the code.
#

# fetch user home directory from /etc/passwd file
export USER_HOME=$(awk -F":" '{print $6}' /etc/passwd | grep -m1 $(whoami))

# if in debug mode
if [ -n "${ARTISAN_DEBUG+x}" ]; then
  printf "RUNTIME DEBUG INFO:"
  printf "===========================================================================\n"
  printf "* home => '%s'\n" "$USER_HOME"
  printf "* user => '%s'\n\n" $(whoami)
  printf "* current directory =>\n"
  ls -la
  printf "\n"
  printf "* root directory =>\n"
  ls -la /
  printf "===========================================================================\n"
fi

# require an application package name
if [ -z "${ART_PACKAGE_NAME+x}" ]; then
  echo "missing ART_PACKAGE_NAME variable"
  exit 1
fi

art runa -u="${ART_REG_USER}:${ART_REG_PWD}" --clean "${ART_PACKAGE_NAME}"