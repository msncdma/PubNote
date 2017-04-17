- 统计行数
```
find . "(" -name "*.m" -or -name "*.md" ")" -print0 | xargs -0 wc -l
```
- ls recursive, for searching files that match
```
ls -lR | grep "your_search"
find . -name "*" | grep word
```





- grep recursive, for searching content inside files
```
grep -R "content_to_search" /path/to/directory
find . -type f -print0 | xargs -0 grep word

```

- Otherwise, use the -exec primary of find. This is the usual way of achieving the same effect as xargs, except without constraints on file names. Reasonably recent versions of find allow you to group several files in a single call to the auxiliary command. Passing /dev/null to grep ensures that it will show the file name in front of each match, even if it happens to be called on a single file.
```
find . -type f -exec grep word /dev/null {} +
```
- Older versions of find (on older systems or OpenBSD, or reduced utilities such as BusyBox) can only call the auxiliary command on one file at a time.
```
find . -type f -exec grep word /dev/null {} \;
find . -name  * -exec ls -a {} \;

find ~ -iname '*.jpg' -exec ls {} \;
# vs
find ~ -iname '*.jpg' -exec ls {} +
```

- What does “{} \;” mean in a Linux command?
```
The \; part is basically telling find "okay, I'm done with the command I wanted to execute".
{} is Bash 4 里的 brace expansion
```

- Some versions of find and xargs have extensions that let them communicate correctly, using null characters to separate file names so that no quoting is required. These days, only OpenBSD has this feature without having -exec … {} +.
```
find . -type f -print0 | xargs -0 grep word /dev/null
```
