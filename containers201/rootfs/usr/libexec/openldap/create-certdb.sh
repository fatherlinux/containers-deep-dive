#!/bin/bash
# Author: Jan Vcelak <jvcelak@redhat.com>

set -e

# default options

CERTDB_DIR=/etc/openldap/certs

# internals

MODULE_CKBI="$(rpm --eval %{_libdir})/libnssckbi.so"
RANDOM_SOURCE=/dev/urandom
PASSWORD_BYTES=32

# parse arguments

usage() {
	printf "usage: create-certdb.sh [-d certdb]\n" >&2
	exit 1
}

while getopts "d:" opt; do
	case "$opt" in
	d)
		CERTDB_DIR="$OPTARG"
		;;
	\?)
		usage
		;;
	esac
done

[ "$OPTIND" -le "$#" ] && usage

# verify target location

if [ ! -d "$CERTDB_DIR" ]; then
	printf "Directory '%s' does not exist.\n" "$CERTDB_DIR" >&2
	exit 1
fi

if [ ! "$(find "$CERTDB_DIR"  -maxdepth 0 -empty | wc -l)" -eq 1 ]; then
	printf "Directory '%s' is not empty.\n" "$CERTDB_DIR" >&2
	exit 1
fi

# create the database

printf "Creating certificate database in '%s'.\n" "$CERTDB_DIR" >&2

PASSWORD_FILE="$CERTDB_DIR/password"
OLD_UMASK="$(umask)"
umask 0377
dd if=$RANDOM_SOURCE bs=$PASSWORD_BYTES count=1 2>/dev/null | base64 > "$PASSWORD_FILE"
umask "$OLD_UMASK"

certutil -d "$CERTDB_DIR" -N -f "$PASSWORD_FILE" &>/dev/null

# load module with builtin CA certificates

echo | modutil -dbdir "$CERTDB_DIR" -add "Root Certs" -libfile "$MODULE_CKBI" &>/dev/null

# tune permissions

for dbfile in "$CERTDB_DIR"/*.db; do
	chmod 0644 "$dbfile"
done

exit 0
