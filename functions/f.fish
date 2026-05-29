function f -a pathname
  test -f $pathname; or ret "$pathname not found"
  set --local self (abspath (status filename))
  set --local d (path dirname $self)
  set --local me (path basename --no-extension $self)
  set --show self d me >&2
end