<%*  
let title = await tp.system.prompt("Set FileName")  
let file = "Poetry/" + title  
-%>  
<% tp.file.create_new(tp.file.find_tfile("new-note"),file, true) %>
