# Retain the historical resource label to preserve existing state addresses.
# Folder names and container-visible paths are entirely supplied by inputs.
resource "sftpgo_folder" "audiobooks" {
  for_each    = var.folders
  name        = each.value.name
  mapped_path = each.value.mapped_path
  filesystem  = { provider = 0 }
}
