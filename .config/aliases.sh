# alias for mkdir so that it makes required parent directory
alias mkdir="mkdir -p"
# alias for grep
alias grep='grep --color=auto'

alias ls="lsd"
alias ll="lsd -lh"
alias tree="lsd --tree"

alias cat="bat"

backup() {
  # Function to create a backup of a given file.
  #
  # Usage:
  #   backup <filename>
  #
  # Arguments:
  #   filename: The name of the file to back up.
  #
  # Returns:
  #   0  if the backup is created successfully.
  #   1  if there is an error, such as missing filename argument or the file does not exist.
  #
  # Example:
  #   backup myfile.txt

  if [ -z "$1" ]; then
    echo "Usage: backup <filename>"
    return 1
  fi

  local file="$1"
  local backup_file="${file}.backup"

  if [ ! -e "$file" ]; then
    echo "Error: File '$file' does not exist."
    return 1
  fi

  if mv -- "$file" "$backup_file"; then
    echo "Backup created: '$backup_file'"
    return 0
  else
    echo "Error: Failed to create backup for '$file'."
    return 1
  fi
}