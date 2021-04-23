app <- ShinyDriver$new("../../")
app$snapshotInit("SetUp")

app$setInputs(sidebarItemExpanded = "1.GettingStarted")
app$snapshot()
app$setInputs(tabs = "setup")
app$snapshot()
app$setInputs(next_button = "click")
app$snapshot()
