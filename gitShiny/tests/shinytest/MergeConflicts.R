app <- ShinyDriver$new("../../")
app$snapshotInit("MergeConflicts")

app$setInputs(sidebarCollapsed = FALSE)
app$setInputs(sidebarItemExpanded = "4.BasicGitBranching")
app$snapshot()
app$setInputs(tabs = "conflicts")
app$snapshot()
app$snapshot()
