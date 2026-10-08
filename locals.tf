locals {
  ssh_key = file(pathexpand("~/.ssh/id_ed25519.pub"))
}
