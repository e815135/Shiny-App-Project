app <- ShinyDriver$new("../../")
app$snapshotInit("RevertingChanges")

app$setInputs(sidebarCollapsed = FALSE)
app$setInputs(sidebarItemExpanded = "3.BasicGitCommands")
app$snapshot()
app$setInputs(tabs = "revert")
app$snapshot()
app$setInputs(`revert_changes_ui_1-next_button` = "click")
app$snapshot()
app$setInputs(`revert_changes_ui_1-next_button` = "click")
app$snapshot()
app$setInputs(`revert_changes_ui_1-next_button` = "click")
app$snapshot()
app$setInputs(`revert_changes_ui_1-next_button` = "click")
app$snapshot()
app$setInputs(`revert_changes_ui_1-next_button` = "click")
app$snapshot()
app$setInputs(`revert_changes_ui_1-previous_button` = "click")
app$snapshot()
app$setInputs(`revert_changes_ui_1-previous_button` = "click")
app$snapshot()
app$setInputs(`revert_changes_ui_1-previous_button` = "click")
app$snapshot()
app$setInputs(`revert_changes_ui_1-previous_button` = "click")
app$snapshot()
app$setInputs(`revert_changes_ui_1-previous_button` = "click")
app$snapshot()
app$snapshot()
app$setInputs(next_button = "click")
app$snapshot()
