project = {
  name            = "	wiai-bootstrap-seed",
  service_account = ""
}

#organization_id
parent_id = "3218055020"

# #folders list
# folders = [
#   "fldr-development",
#   "fldr-staging",
#   "fldr-production",
#   "fldr-common-service",
#   "fldr-uat"
# ]

# ##log sink details 
# bucket_project = "prj-common-srv-shared-0158"
# log_filter     = "log_id(\"cloudaudit.googleapis.com/activity\") OR log_id(\"cloudaudit.googleapis.com/policy\") OR log_id(\"cloudaudit.googleapis.com/data_access\") OR log_id(\"cloudaudit.googleapis.com/access_transparency\") OR log_id(\"dns.googleapis.com/dns_queries\") OR (log_id(\"compute.googleapis.com/nat_flows\") AND resource.type=\"nat_gateway\") OR (log_id(\"compute.googleapis.com/firewall\") AND resource.type=\"gce_subnetwork\") OR (log_id(\"compute.googleapis.com/vpc_flows\") AND resource.type=\"gce_subnetwork\") OR ((log_id(\"ids.googleapis.com/threat\") OR log_id(\"ids.googleapis.com/traffic\")) AND resource.type=\"ids.googleapis.com/Endpoint\") OR (log_id(\"requests\") AND resource.type=\"http_load_balancer\") OR (log_id(\"syslog\") AND resource.type=\"gce_instance\") OR ((log_id(\"winevt.raw\") OR log_id(\"windows_event_log\")) AND resource.type=\"gce_instance\") OR log_id(\"resource.type=gce\") OR log_id(\"resource.type=gcs_bucket\") OR log_id(\"resource.type=cloudsql_database\") OR log_id(\"resource.type=bigquery_resource\")"
# location       = "asia-southeast1"
# retention_policy = {
#   retention_period = 365
#   is_locked        = true
# }

# lifecycle_rules = [ {
#   action = {
#     storage_class = "ARCHIVE"
#     type = "SetStorageClass"
#   }
#   condition = {
#     age = "40"
#   }
# } ]

#org policy
org-policy = [
  {
    constraint        = "constraints/iam.workloadIdentityPoolAwsAccounts"
    policy_type       = "list"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/cloudfunctions.allowedIngressSettings"
    policy_type       = "list"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = null
    allow             = ["ALLOW_INTERNAL_ONLY"]
    deny              = []
    allow_list_length = 1
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/run.allowedIngress"
    policy_type       = "list"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = null
    allow             = ["internal-and-cloud-load-balancing"]
    deny              = []
    allow_list_length = 1
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/cloudfunctions.allowedVpcConnectorEgressSettings"
    policy_type       = "list"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = null
    allow             = ["ALL_TRAFFIC"]
    deny              = []
    allow_list_length = 1
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/run.allowedVPCEgress"
    policy_type       = "list"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = null
    allow             = ["all-traffic"]
    deny              = []
    allow_list_length = 1
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/datastream.disablePublicConnectivity"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/compute.vmExternalIpAccess"
    policy_type       = "list"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/compute.disableAllIpv6"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/iam.disableAuditLoggingExemption"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/iam.automaticIamGrantsForDefaultServiceAccounts"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/bigquery.disableBQOmniAWS"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/bigquery.disableBQOmniAzure"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/compute.disableGlobalCloudArmorPolicy"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/compute.disableGlobalSelfManagedSslCertificate"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/iap.requireGlobalIapWebDisabled"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/compute.disableGlobalLoadBalancing"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/compute.disableGuestAttributesAccess"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/compute.disableInternetNetworkEndpointGroup"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/compute.disablePrivateServiceConnectCreationForConsumers"
    policy_type       = "list"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/iam.disableServiceAccountKeyCreation"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/iam.disableServiceAccountKeyUpload"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/appengine.disableCodeDownload"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/compute.disableNestedVirtualization"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/compute.disableSerialPortAccess"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/compute.disableSerialPortLogging"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/storage.publicAccessPrevention"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/storage.uniformBucketLevelAccess"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/gcp.detailedAuditLoggingMode"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/gcp.resourceLocations"
    policy_type       = "list"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = null
    allow             = ["in:asia-south1-locations", "in:asia-east1-locations"]
    deny              = []
    allow_list_length = 1
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/compute.requireOsLogin"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/cloudfunctions.requireVPCConnector"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/compute.restrictDedicatedInterconnectUsage"
    policy_type       = "list"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/compute.restrictPartnerInterconnectUsage"
    policy_type       = "list"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/sql.restrictPublicIp"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/iam.restrictCrossProjectServiceAccountLienRemoval"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/compute.restrictSharedVpcHostProjects"
    policy_type       = "list"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = null
    allow             = ["under:folders/896463035841"]
    deny              = []
    allow_list_length = 1
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/compute.restrictXpnProjectLienRemoval"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/compute.vmCanIpForward"
    policy_type       = "list"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/compute.restrictVpcPeering"
    policy_type       = "list"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = null
    allow             = ["under:folders/896463035841"]
    deny              = []
    allow_list_length = 1
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/compute.skipDefaultNetworkCreation"
    policy_type       = "boolean"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
  {
    constraint        = "constraints/compute.restrictCloudNATUsage"
    policy_type       = "list"
    policy_for        = "organization"
    organization_id   = "3218055020"
    folder_id         = null
    project_id        = null
    enforce           = true
    allow             = []
    deny              = []
    allow_list_length = 0
    exclude_folders   = ["folders/1043307916975"]
    exclude_projects  = []
  },
]