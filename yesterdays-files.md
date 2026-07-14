---
_organized: true
---

### another shot at a table (yesterday's files (mtime))

```dataview 
TABLE file.ctime, file.mtime, file.tags, file.folder FROM "" 
WHERE file.mtime >= date(today) - dur(1d) 
```