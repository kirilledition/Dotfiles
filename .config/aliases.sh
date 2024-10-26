alias mkdir="mkdir -p"
alias grep="grep --color=auto"
alias cp="cp -r"

alias ls="lsd"
alias l="lsd -la"
alias tree="lsd --tree"

alias cat="bat"
alias extract="unar"
alias df="duf"

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
