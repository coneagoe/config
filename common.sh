is_installed ()
{
  [ $(which $1 2>&1 > /dev/null) ]
}	# ----------  end of function is_installed  ----------
