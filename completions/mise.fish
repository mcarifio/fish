status is-interactive; or return 0
set --local cmd (path basename --no-extension (status filename))
command --quiet $cmd; or return 0

$cmd completion (shell) | source
