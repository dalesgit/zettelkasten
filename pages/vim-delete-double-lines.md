---
id: vim-delete-double-lines
aliases: []
tags:
  - vim
---
## blank lines to single blank lines
To replace double blank lines with single blank lines in Vim, the following command can be used:
Code

```
:%s/\n\n\n\+/\r\r/g
```

Here's a breakdown of the command:

:%s: This initiates a substitute command across the entire file (%).
/\n\n\n\+/: This is the search pattern.
\n: Represents a newline character.
\n\n: Matches two consecutive newline characters, indicating a double blank line (or the start of multiple blank lines).
\n\+: Matches one or more additional newline characters, ensuring that any sequence of three or more blank lines is also targeted.
/\r\r/: This is the replacement pattern.
\r: Represents a carriage return, which Vim interprets as a single newline when used in replacement. Using \r\r effectively replaces the multiple newlines with two newlines, resulting in a single blank line.
/g: This flag ensures that all occurrences on each line are replaced, not just the first one.
Alternative for replacing multiple empty lines with a single empty line:
If the goal is to replace any number of consecutive empty lines with just one empty line, the following command can be used:
Code

```
:%s/^\s*$\n^\s*$/\r/
```

^\s*
$\n^\s*$
\n\+: This searches for:
^\s*$: An empty line (potentially containing only whitespace).
\n: A newline character.
^\s*$: Another empty line.
\n\+: One or more additional newline characters (to catch sequences of more than two empty lines).
\r: This replaces the matched pattern with a single newline, effectively reducing multiple empty lggjjjjjjjjkggines to one.
Choose the command that best fits the specific pattern of "double lines" you are trying to replace.

## single line to double lines
To convert single line spacing to double line spacing in Vim, use the command 

```
~~:%s/^$/\\r/g~~
or
:$s/\n/\r\r/g

```

in command mode.
 This command replaces every single blank line (matched by ^$) with a carriage return (\\r), effectively creating double spacing between lines.
 After executing this command, save and exit the file as usual to retain the changes.
