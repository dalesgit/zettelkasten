<%*  
let title = await tp.system.prompt("Set FileName")  
let file = "000 Output/" + title  
-%>  
<% tp.file.create_new(tp.file.find_tfile("a"),file, true) %>
