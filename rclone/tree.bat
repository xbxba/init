@echo off

:TREE1
rclone tree --dirsfirst --full-path --quote --noindent %*
goto:EOF




:TREE
@rclone tree %*
goto:EOF











:FLAGS


Usage:
  rclone tree remote:path [flags]

Flags:
  -a, --all             All files are listed (list . files too).
  -C, --color           Turn colorization on always.
  -d, --dirs-only       List directories only.
      --dirsfirst       List directories before files (-U disables).
      --full-path       Print the full path prefix for each file.
  -h, --help            help for tree
      --human           Print the size in a more human readable way.
      --level int       Descend only level directories deep.
  -D, --modtime         Print the date of last modification.
      --noindent        Don't print indentation lines.
      --noreport        Turn off file/directory count at end of tree listing.
  -o, --output string   Output to file instead of stdout.
  -p, --protections     Print the protections for each file.
  -Q, --quote           Quote filenames with double quotes.
  -s, --size            Print the size in bytes of each file.
      --sort string     Select sort: name,version,size,mtime,ctime.
      --sort-ctime      Sort files by last status change time.
  -t, --sort-modtime    Sort files by last modification time.
  -r, --sort-reverse    Reverse the order of the sort.
  -U, --unsorted        Leave files unsorted.
      --version         Sort files alphanumerically by version.

