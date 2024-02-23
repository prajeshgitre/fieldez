# module "log_export" {
#   source                 = "../../modules/terraform-google-log-export/"
#   for_each               = toset(var.folders)
#   destination_uri        = "storage.googleapis.com/bkt-dra-cmn-srv-centalized-logging-${each.key}"
#   filter                 = var.log_filter
#   log_sink_name          = "log-sink-${each.key}"
#   parent_resource_id     = module.folders.folders_map["${each.key}"].id
#   parent_resource_type   = "folder"
#   unique_writer_identity = true
#   include_children       = true
#   depends_on             = [module.folders, module.destination]
# }

# module "destination" {
#   source     = "../../modules/terraform-google-storage/"
#   for_each   = toset(var.folders)
#   name       = "bkt-dra-cmn-srv-centalized-logging-${each.key}"
#   versioning       = false
#   project_id       = var.bucket_project
#   location         = var.location
#   retention_policy = var.retention_policy
#   lifecycle_rules  = var.lifecycle_rules
# }

# resource "google_storage_bucket_iam_member" "storage_sink_member" {
#   for_each   = toset(var.folders)
#   bucket     = "bkt-dra-cmn-srv-centalized-logging-${each.key}"
#   role       = "roles/storage.legacyBucketWriter"
#   member     = module.log_export[each.key].writer_identity
#   depends_on = [module.folders, module.destination]
# }
