---
creation date:<% tp.file.creation_date() %>
modification date:<% tp.file.creation_date("dddd Do MMMM YYYY HH:mm:ss") %>
type:#knowledge #todo
alias:
---
# <% tp.file.title %>
[Wikipedia](https://en.wikipedia.org/wiki/<%tp.file.title %><% tp.file.cursor() %>)

---
> >> 


---
## Details



---
# Tags


---
# Mentions
``` dataview
list
FROM [[]]
Sort file.ctime Asc
```
# Wikipedia
<iframe 
border=true
height=800
width=800
src="https://en.wikipedia.org/wiki/<%tp.file.title %>"></iframe>


****