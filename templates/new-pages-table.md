### another shot at a table (last week files)

```dataview 
TABLE file.ctime, file.mtime, file.tags, file.folder FROM "" 
WHERE file.mtime >= date(today) - dur(7d) 
```
---
### Notes created today
```dataview
List FROM "" WHERE file.cday = date("<%tp.date.now("YYYY-MM-DD")%>") SORT file.ctime asc
```

### Notes last touched today
```dataview
List FROM "" WHERE file.mday = date("<%tp.date.now("YYYY-MM-DD")%>") SORT file.mtime asc
```
