---
_organized: true
---
[]()Last modified file cf. https://forum.obsidian.md/t/dataview-list-of-25-most-recently-modified-files-in-vault/23771

```dataview 
TABLE dateformat(file.mtime, "dd.MM.yyyy - HH:mm") AS "Last modified" FROM "" SORT file.mtime DESC LIMIT 10 
```
dataview
LIST 
WHERE date(today) - file.mtime <= dur(3 days)
WHERE file.name != this.file.name
SORT file.mtime DESC

dataview
LIST 
WHERE date(today) - file.mtime <= dur(3 days)
WHERE file.name != this.file.name
SORT file.mtime DESC




![[couple-on-cruise.jpeg]]

