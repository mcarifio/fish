status is-interactive; or return 0
begin
  set cmd (path change-extension '' -- (status basename))
  command --quiet $cmd; or return 0

  # start emacs daemon in the background
  systemctl enabled --user --now emacs; and loginctl enable-linger $USER
  
  set --global --export EDITOR emacsclient
  set --global --export VISUAL $EDITOR
end
