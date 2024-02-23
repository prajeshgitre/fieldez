
# project = {
#   name            = "",
#   service_account = ""
# }

// Details of host projects
# projects_list = {
#   proj1 = {
#     prefix         = "prj"
#     project_name   = "stage-shared-host-01"
#     project_id     = "stage-shared-host-01"
#     project_folder = "folders/896463035841"
#     labels = {
#       "customer" : "dra",
#       "requestor" : "gavin",
#       "business-code" : "0001",
#       "billing-code" : "0001",
#       "environment" : "shared",
#       "appname" : "landing-zone",
#       "project" : "prj-stage-shared-host-01",
#       "owner" : "gavin"
#     }
#   }
# }

# // Service Project Connetion
# service_projects_list = {
#   stage_proj01 = {
#     prefix         = "prj"
#     project_name   = "stage-srv-01"
#     project_id     = "stage-srv-01"
#     project_folder = "folders/832315527434"
#     parent_folder  = "fldr-staging"
#     labels = {
#       "customer" : "dra",
#       "requestor" : "gavin",
#       "business-code" : "0001",
#       "billing-code" : "0001",
#       "environment" : "staging",
#       "appname" : "landing-zone",
#       "project" : "prj-stage-srv-01",
#       "owner" : "gavin"
#     }
#     activate_apis = ["compute.googleapis.com"]
#   },

# }

# #billing account id
# billing_account = "010407-68E658-BF758C"

# #budget alert details
# amount                  = 50000
# notification_type       = "email"
# notification_email      = "gavin.alexander@doctoranywhere.com"
# notification_project_id = "prj-common-srv-shared-0158"
# thresholds = [{
#   percentage = 0.25,
#   basis      = "CURRENT_SPEND"
#   },
#   {
#     percentage = 0.5,
#     basis      = "CURRENT_SPEND"
#   },
#   {
#     percentage = 0.75,
#     basis      = "CURRENT_SPEND"
#   },
#   {
#     percentage = 0.8,
#     basis      = "CURRENT_SPEND"
#   },
#   {
#     percentage = 0.9
#     basis      = "CURRENT_SPEND"
#   },
#   {
#     percentage = 0.25,
#     basis      = "FORECASTED_SPEND"
#   },
#   {
#     percentage = 0.5,
#     basis      = "FORECASTED_SPEND"
#   },
#   {
#     percentage = 0.75,
#     basis      = "FORECASTED_SPEND"
#   },
#   {
#     percentage = 0.8,
#     basis      = "FORECASTED_SPEND"
#   },
#   {
#     percentage = 0.9,
#     basis      = "FORECASTED_SPEND"
#   }
# ]

# vpc_list = {
#   vpc-stage-shared-host-01 = {
#     shared_vpc_name                        = "vpc-stage-shared-host-01"
#     project_id                             = "prj-stage-shared-host-016d"
#     delete_default_internet_gateway_routes = false
#     subnets = [
#       {
#         subnet_name           = "sb-stage-ase1-app-01"
#         subnet_ip             = "10.21.60.0/22"
#         subnet_region         = "asia-southeast1"
#         subnet_private_access = "true"
#         subnet_flow_logs      = "false"
#         description           = "subnet for app in stage host Vpc "
#       },
#       {
#         subnet_name           = "sb-stage-ase1-db-01"
#         subnet_ip             = "10.21.68.0/22"
#         subnet_region         = "asia-southeast1"
#         subnet_private_access = "true"
#         subnet_flow_logs      = "false"
#         description           = "subnet for DB in stage host Vpc"
#       },
#       {
#         subnet_name           = "sb-stage-ase1-gke-01"
#         subnet_ip             = "10.21.72.0/22"
#         subnet_region         = "asia-southeast1"
#         subnet_private_access = "true"
#         subnet_flow_logs      = "false"
#         description           = "subnet for gke app in stage host Vpc "
#       },
#     ]
#     secondary_ranges = {
#       sb-stage-ase1-gke-01 = [
#         {
#           range_name    = "sb-stage-ase1-gke-pod-01"
#           ip_cidr_range = "10.21.88.0/22"
#         },
#         {
#           range_name    = "sb-stage-ase1-gke-svc-01"
#           ip_cidr_range = "10.21.96.80/28"
#         }
#       ]
#     }
#   }
# }

# // Shared VPC Attachemnt Details

host_project_id     = "prj-common-srv-single-01"
# service_project_ids = ["prj-stage-srv-016d"]
# host_subnets        = ["sb-stage-ase1-app-01","sb-stage-ase1-db-01","sb-stage-ase1-gke-01"]
# host_subnet_regions = ["asia-southeast1"]
# host_subnet_users = {
#   sb-stage-ase1-app-01 = ""
#   sb-stage-ase1-db-01  = ""
#   sb-stage-ase1-gke-01 = ""
# }

# // [START vpc_firewall_create]

# firewall_rules_list = {
#   fw-gcp-ingress-iap-gcp-allow = {
#     network_name = "vpc-stage-shared-host-01"
#     project_id   = "prj-stage-shared-host-016d"
#     rules = [
#       {
#         name                    = "fw-stage-ingress-allow-gcp-iap"
#         priority                = 1000
#         description             = "allow iap acccess to vm"
#         direction               = "INGRESS"
#         ranges                  = ["35.235.240.0/20"]
#         source_tags             = null
#         source_service_accounts = null
#         target_tags             = ["ssh", "rdp"]
#         target_service_accounts = null
#         log_config              = null
#         deny                    = []
#         allow = [{
#           protocol = "tcp"
#           ports    = ["22", "3389"]
#         }]
#       }
#     ]
#   },
#   fw-gcp-ingress-hc-gke-nlb-allow = {
#     network_name = "vpc-stage-shared-host-01"
#     project_id   = "prj-stage-shared-host-016d"
#     rules = [
#       {
#         name                    = "fw-gcp-ingress-hc-gke-nlb-allow"
#         priority                = 1000
#         description             = "allow healthcheck to gke NLB"
#         direction               = "INGRESS"
#         ranges                  = ["35.191.0.0/16","130.211.0.0/22"]
#         source_tags             = null
#         source_service_accounts = null
#         target_tags             = ["gke-gke-dra-stage-ase1-app-001"]
#         target_service_accounts = null
#         log_config              = null
#         deny                    = []
#         allow = [{
#           protocol = "tcp"
#           ports    = ["10256"]
#         }]
#       }
#     ]
#   },
#   fw-gcp-ingress-gke-nlb-bastion-allow = {
#     network_name = "vpc-stage-shared-host-01"
#     project_id   = "prj-stage-shared-host-016d"
#     rules = [
#       {
#         name                    = "fw-gcp-ingress-gke-nlb-bastion-allow"
#         priority                = 1000
#         description             = "allow healthcheck to gke NLB"
#         direction               = "INGRESS"
#         ranges                  = ["10.21.60.0/22"]
#         source_tags             = null
#         source_service_accounts = null
#         target_tags             = ["gke-gke-dra-stage-ase1-app-001"]
#         target_service_accounts = null
#         log_config              = null
#         deny                    = []
#         allow = [{
#           protocol = "tcp"
#           ports    = ["2575"]
#         }]
#       }
#     ]
#   },
# }
# // [END vpc_firewall_create]

# // [START route_create]

# routes_list = {
#   rt-stage-pvt-goog-apis-01 = {
#     vpc_name   = "vpc-stage-shared-host-01"
#     project_id = "prj-stage-shared-host-016d"
#     routes = [
#       {
#         name              = "rt-stage-pvt-goog-apis-01"
#         description       = "rt-stage-pvt-goog-apis-01"
#         destination_range = "199.36.153.8/30"
#         next_hop_internet = "true"
#         priority          = "1000"
#       }
#     ]
#   },
#   rt-stage-rst-goog-apis-01 = {
#     vpc_name   = "vpc-stage-shared-host-01"
#     project_id = "prj-stage-shared-host-016d"
#     routes = [
#       {
#         name              = "rt-stage-rst-goog-apis-01"
#         description       = "rt-stage-rst-goog-apis-01"
#         destination_range = "199.36.153.4/30"
#         next_hop_internet = "true"
#         priority          = "1000"
#       }
#     ]
#   },
# }

# // [END route_create]

# //create Private service connection
# private_service_connection = {
#   psc-dra-stage-as1-01 = {
#     address       = ""
#     vpc_name      = ""
#     name          = ""
#     prefix_length = 24
#   },
# }

// cloud dns link

network_self_link = "vpc-common-srv-single-01"

cloud_dns = [
  {
    type   = "private"
    name   = "accounts-google-com"
    domain = "accounts.google.com."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.accounts.google.com.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "appengine-google-com"
    domain = "appengine.google.com."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.appengine.google.com.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "appspot-com"
    domain = "appspot.com."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.appspot.com.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "cloudfunctions-net"
    domain = "cloudfunctions.net."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.cloudfunctions.net.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "cloudproxy-app"
    domain = "cloudproxy.app."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.cloudproxy.app.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "composer-cloud-google-com"
    domain = "composer.cloud.google.com."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.composer.cloud.google.com.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "composer-googleusercontent-com"
    domain = "composer.googleusercontent.com."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.composer.googleusercontent.com.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "datafusion-cloud-google-com"
    domain = "datafusion.cloud.google.com."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.datafusion.cloud.google.com.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "datafusion-googleusercontent-com"
    domain = "datafusion.googleusercontent.com."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.datafusion.googleusercontent.com.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "dataproc-cloud-google-com"
    domain = "dataproc.cloud.google.com."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.dataproc.cloud.google.com.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "dataproc-googleusercontent-com"
    domain = "dataproc.googleusercontent.com."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.dataproc.googleusercontent.com.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "dl-google-com"
    domain = "dl.google.com."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.dl.google.com.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "gcr-io"
    domain = "gcr.io."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.gcr.io.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "googleadapis-com"
    domain = "googleadapis.com."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.googleadapis.com.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "googleapis-com"
    domain = "googleapis.com."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.googleapis.com.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "gstatic-com"
    domain = "gstatic.com."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.gstatic.com.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "ltsapis-goog"
    domain = "ltsapis.goog."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.ltsapis.goog.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "notebooks-cloud-google-com"
    domain = "notebooks.cloud.google.com."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.notebooks.cloud.google.com.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "notebooks-googleusercontent-com"
    domain = "notebooks.googleusercontent.com."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.notebooks.googleusercontent.com.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "backupdr-cloud-google-com"
    domain = "backupdr.cloud.google.com."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.backupdr.cloud.google.com.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "backupdr-googleusercontent-com"
    domain = "backupdr.googleusercontent.com."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.backupdr.googleusercontent.com.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "packages-cloud-google-com"
    domain = "packages.cloud.google.com."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.packages.cloud.google.com.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "pkg-dev"
    domain = "pkg.dev."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.pkg.dev.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "pki-goog"
    domain = "pki.goog."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.pki.goog.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "run-app"
    domain = "run.app."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.run.app.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
  {
    type   = "private"
    name   = "source-developers-google-com"
    domain = "source.developers.google.com."
    recordsets = [
      {
        name = "private"
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
      {
        name = "*"
        type = "CNAME"
        ttl  = 300
        records = [
          "private.source.developers.google.com.",
        ]
      },
      {
        name = ""
        type = "A"
        ttl  = 300
        records = [
          "199.36.153.8", "199.36.153.9", "199.36.153.10", "199.36.153.11"
        ]
      },
    ]
  },
]

# //Reserve static IP Address
# reserve_static_ip = [
#   {
#     name         = "ip-static-nat-stage-01"
#     project_id   = "prj-stage-shared-host-016d"
#     region       = "asia-southeast1"
#     address_type = "EXTERNAL"
#   },
# ]


# //variable to create cloud nat 
# cloud_nat = [
#   {
#     project_id     = "prj-stage-shared-host-016d"
#     router_network = "vpc-stage-shared-host-01"
#     region         = "asia-southeast1"
#     nat_name       = "cn-stage-asia-southeast1-cn1"
#     router_name    = "cr-stage-asia-southeast1-cr1"
#     create_router  = true
#     //static address should be declared in above static_ip_name variable
#     static_ip_name                     = ["ip-static-nat-stage-01"]
#     source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
#     // "LIST_OF_SUBNETWORKS"
#     subnetworks = [
#     ]
#   },
# ]