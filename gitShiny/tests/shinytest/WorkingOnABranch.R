app <- ShinyDriver$new("../../")
app$snapshotInit("WorkingOnABranch")

app$setInputs(sidebarCollapsed = FALSE)
app$setInputs(sidebarItemExpanded = "4.BasicGitBranching")
app$snapshot()
app$setInputs(tabs = "branch")
app$snapshot()
app$setInputs(`on_branch_ui_1-next_button` = "click")
app$snapshot()
app$setInputs(`on_branch_ui_1-next_button` = "click")
app$snapshot()
app$setInputs(`on_branch_ui_1-next_button` = "click")
app$snapshot()
app$setInputs(`on_branch_ui_1-next_button` = "click")
app$snapshot()
app$setInputs(`on_branch_ui_1-next_button` = "click")
app$snapshot()
app$setInputs(`on_branch_ui_1-next_button` = "click")
app$snapshot()
app$setInputs(`on_branch_ui_1-previous_button` = "click")
app$snapshot()
app$setInputs(`on_branch_ui_1-previous_button` = "click")
app$snapshot()
app$setInputs(`on_branch_ui_1-previous_button` = "click")
app$snapshot()
app$setInputs(`on_branch_ui_1-previous_button` = "click")
app$snapshot()
app$setInputs(`on_branch_ui_1-previous_button` = "click")
app$snapshot()
app$setInputs(`on_branch_ui_1-previous_button` = "click")
app$snapshot()
app$snapshot()
app$setInputs(next_button = "click")
app$snapshot()
