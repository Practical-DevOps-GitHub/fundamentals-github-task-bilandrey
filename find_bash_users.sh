#!/bin/bash
PASSWORD_FILE="${1:-/etc/passwd}"
 
[[ ! -f "$PASSWORD_FILE" ]] && echo "Error: '$PASSWORD_FILE' not found." >&2 && exit 1
[[ ! -r "$PASSWORD_FILE" ]] && echo "Error: '$PASSWORD_FILE' is not readable." >&2 && exit 1
 
awk -F: '$7 == "/bin/bash" { print $1, $3, $6 }' "$PASSWORD_FILE"
