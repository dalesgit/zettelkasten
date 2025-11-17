---  
date:  
month:  
type: monthly  
---  
#  
```dataviewjs  
let p = dv.pages('"Daily Notes"');  
let t = 0, d = 0;  
for (let n of p) { if (n.file.tasks) { t += n.file.tasks.length; d += n.file.tasks.where(x => x.completed).length; }}  
let w = p.where(n => n.focus_area == "Work").length;  
let e = p.where(n => n.focus_area == "Wellness").length;  
let g = p.where(n => n.focus_area == "Growth").length;  
dv.paragraph(d + "/" + t + " tasks | W:" + w + " E:" + e + " G:" + g);  
dv.list(dv.pages('"Weekly Notes"').sort(n => n.week, 'asc').map(n => n.file.link));  
```  
## Notes