
###vm vars

variable "vms_resources" {
  type = map(
    map(number)
  )
  default = {
    "vm_web_resources" = {
      "cores" = 2
      "memory" = 1
      "core_fraction" = 20
    }
    "vm_db_resources" = {
      cores = 2
      memory = 2
      core_fraction = 20
    }
  }
}
