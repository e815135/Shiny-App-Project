app <- ShinyDriver$new("../../")
app$snapshotInit("RemovingUntrackedFiles")

app$setInputs(sidebarCollapsed = FALSE)
app$setInputs(sidebarItemExpanded = "3.BasicGitCommands")
app$snapshot()
app$setInputs(tabs = "untracked")
app$snapshot()
app$snapshot()
app$setInputs(next_button = "click")
app$snapshot()
