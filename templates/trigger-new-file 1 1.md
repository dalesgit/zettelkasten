<%*
var folderPathOrName = "Poetry"; // Change this to your desired folder path or name
const files = this.app.vault.getAllLoadedFiles();
var folder;
var folderPath = tp.obsidian.normalizePath(folderPathOrName);
files.forEach((file) => {
    if (file.path == folderPath) { return folder = file; }
    if (file.name == folderPathOrName) { return folder = file; }
});
if (folder == undefined) { new Notice("can't find folder", 5000); return; }

const template = tp.file.find_tfile("new-poem");
const template_content = await this.app.vault.read(template);
var title = await tp.system.prompt("Set FileName");
var newfile = await this.app.vault.create(folder.path + "/" + title + ".md", template_content);

const active_leaf = this.app.workspace.activeLeaf;
if (!active_leaf) { new Notice("No active leaf", 5000); return; }
await active_leaf.openFile(newfile, { state: { mode: "source" }, });
%>   