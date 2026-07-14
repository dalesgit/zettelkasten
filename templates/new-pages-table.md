---
_organized: true
---
### another shot at a table (last week files)

```dataview 
TABLE file.ctime, file.mtime, file.tags, file.folder FROM "" 
WHERE file.mtime >= date(today) - dur(1d) 
```
---
### Notes created today
```dataview
List FROM "" WHERE file.cday = date(today) SORT file.ctime asc
```

### Notes last touched today
```dataview
List FROM "" WHERE file.mday = date(today) SORT file.mtime asc
```
