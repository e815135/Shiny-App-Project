app <- ShinyDriver$new("../../")
app$snapshotInit("Introduction")

app$setInputs(sidebarCollapsed = FALSE)
app$snapshot()
app$setInputs(sidebarCollapsed = TRUE)
app$snapshot()
