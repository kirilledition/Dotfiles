alias mkdir="mkdir -p"
alias grep="rg"
alias cp="cp -r"

alias ls="eza"
alias l="eza -la"
alias tree="eza --tree"

alias cat="bat"
alias extract="unar"
alias df="duf"
alias du="dust -T 0"

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

create() {
  # Usage:
    # create path/path2/file.toml
    local file_path="$1"
    local dir_path
    dir_path=$(dirname "$file_path")

    # Create directories if they don't exist
    mkdir -p "$dir_path"

    # Create the file
    touch "$file_path"
}

ligatures() {
# Function: ligatures
# Description: Prints various ligatures in the terminal, arranged in groups
#              for clear visibility. Arrows are split across two rows to
#              maintain consistent width with other ligature groups.
    echo "Hyphen and Equals:"
    echo "-- --- == === != !== =!= =:= =/= <= >="

    echo -e "\nAmpersands and Pluses:"
    echo "&& &&& &= ++ +++ ***"

    echo -e "\nSemicolons, Exclamation Marks, and Question Marks:"
    echo ";; !! ?? ??? ?: ?. ?="

    echo -e "\nColons and Comparison:"
    echo "<: :< :> >: <:< <> <<< >>> << >>"

    echo -e "\nPipes:"
    echo "|| -| _|_ |- ||- |= ||="

    echo -e "\nHashes and Parentheses:"
    echo "## ### #### #{ #[ ]# #( #? #_ #_( #: #! #= ^="

    echo -e "\nDollar Signs and Asterisks:"
    echo "<$> <$ $> <+> <+ +> <*> <* *> </ </> />"

    echo -e "\nArrows:"
    echo "<!-- <#-- --> -> ->> <<- <- <=< =<< <<= <== <=> <==> ==>"
    echo "=> =>> >=> >>= >>- >- -< -<< >-> <-< <-| <=| |=> |-> <->"

    echo -e "\nTildes:"
    echo "<<~ <~~ <~ <~> ~~ ~~> ~> ~- -~ ~@"

    echo -e "\nBrackets:"
    echo "[||] |] [| |} {| [< >] |> <| ||> <|| |||> <||| <|>"

    echo -e "\nDots and Colons:"
    echo "... .. .= ..< .? :: ::: := ::= :? :?>"

    echo -e "\nSlashes:"
    echo "// /// /* */ /= //= /=="

    echo -e "\nAt Symbol and Underscores:"
    echo "@_ __ ??? ;;;"
}

rebuild() {
  local nixos_config="$HOME/Dotfiles/nixos"
  local log_file="$nixos_config/nixos-switch.log"

  pushd "$nixos_config" &> /dev/null || return 1

  # Format nix files
  if ! alejandra . &>/dev/null; then
    echo "Error: Alejandra formatting failed"
    popd &> /dev/null
    return 1
  fi

  # Show changes
  git diff -U0 *.nix

  echo "Lighthouse Rebuilding..."
  if sudo nixos-rebuild switch --flake "$nixos_config" &> "$log_file"; then
    echo "Lighthouse Rebuilt"
    
    # Commit changes
    generation=$(nixos-rebuild list-generations | rg current)
    git commit -am "$generation" || echo "Warning: Git commit failed"
  else
    echo "Rebuild failed. Error log:"
    cat "$log_file" | rg error
    popd &> /dev/null
    return 1
  fi

  popd &> /dev/null
  return 0
}