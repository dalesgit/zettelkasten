---  
date:  
week:  
type: weekly  
---  
# Week -  
## Daily Notes  

```dataviewjs  
let wk = dv.current().week;  
let yr = wk.substring(0,4);  
let num = parseInt(wk.substring(6));  
dv.list(dv.pages('"Daily Notes"').where(n => n.date && dv.date(n.date).year == yr && dv.date(n.date).weekNumber == num).sort(n => n.date));  
```  
## Notes