# --> colorls shortcuts
# ls
lsc () {
  colorls --sd
  echo
}
#ls -a
lss () {
  colorls -a --sd
  echo
}
# ls -lA --sed
lsai () {
  colorls -la --sf
  echo
}
lsi () {
  colorls --gs -l
  echo
}
lst () {
  colorls --tree
  echo
}
