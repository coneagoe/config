is_installed ()
{
  $(which $1 2>&1 > /dev/null)
}	# ----------  end of function is_installed  ----------


installer ()
{
  echo "Install $1"
  apt install -y $1
  echo "Install $1 complete"
}
