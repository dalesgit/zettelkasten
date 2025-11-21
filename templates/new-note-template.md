`<%* let qcFileName = await tp.system.prompt("Note Title")`  
`text = qcFileName.replace(":", " -")`  
`titleName = text + " " + tp.date.now("YYYY-MM-DD")`  
`await tp.file.rename(titleName)`  
`await tp.file.move("Work Notes/"+ titleName);-%>`