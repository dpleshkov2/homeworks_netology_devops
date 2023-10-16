locals {
    platform = "netology-develop-platform"
    web = "web"
    db = "db"
    platform_web = "${local.platform}-${local.web}"
    platform_db = "${local.platform}-${local.db}"
test = "123"
}