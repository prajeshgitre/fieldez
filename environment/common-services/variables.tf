# variable "projects_list" {
#   description = "List of projects which needs to be created. project name, project id, folder under which project needs to be created"
#   type = map(object({
#     project_folder = string
#     prefix         = string
#     project_name   = string
#     project_id     = string
#     labels         = map(string)
#   }))
# }

# variable "billing_account" {
#   description = "billing account values"
#   type        = string
# }

# variable "activate_apis" {
#   description = "The list of apis to activate within the project"
#   type        = list(string)
#   default     = ["compute.googleapis.com", "container.googleapis.com"]
# }

# variable "service_projects_list" {
#   description = "List of projects which needs to be created. project name, project id, folder under which project needs to be created"
#   type = map(object({
#     project_folder = string
#     prefix         = string
#     project_name   = string
#     project_id     = string
#     labels         = map(string)
#   }))
# }


# variable "vpc_list" {
#   description = "List of vpcs which needs to be created. alongwith their detail"
#   type = map(object({
#     shared_vpc_name                        = string
#     project_id                             = string
#     delete_default_internet_gateway_routes = bool
#     subnets                                = list(map(string))
#     secondary_ranges                       = map(list(object({ range_name = string, ip_cidr_range = string })))
#   }))
# }

variable "host_project_id" {
  type        = string
  description = "Project id of the shared VPC host project."
}

# passed-in values can be dynamic, so variables used in count need to be separate

# variable "service_project_ids" {
#   type        = list(string)
#   description = "Ids of the service projects that will be attached to the Shared VPC."
# }

# variable "host_subnets" {
#   type        = list(string)
#   description = "List of subnet names on which to grant network user role."
#   default     = []
# }

# variable "host_subnet_regions" {
#   type        = list(string)
#   description = "List of subnet regions, one per subnet."
#   default     = []
# }

# variable "host_subnet_users" {
#   type        = map(any)
#   description = "Map of comma-delimited IAM-style members to which network user roles for subnets will be assigned."
#   default     = {}
# }

# variable "host_service_agent_role" {
#   type        = bool
#   description = "Assign host service agent role to users in host_service_agent_users variable."
#   default     = false
# }

# variable "host_service_agent_users" {
#   type        = list(string)
#   description = "List of IAM-style users that will be granted the host service agent role on the host project."
#   default     = []
# }

# variable "firewall_rules_list" {
#   type = map(object({
#     project_id   = string
#     network_name = string
#     rules = list(object({
#       name                    = string
#       description             = string
#       direction               = string
#       priority                = number
#       ranges                  = list(string)
#       source_tags             = list(string)
#       source_service_accounts = list(string)
#       target_tags             = list(string)
#       target_service_accounts = list(string)
#       allow = list(object({
#         protocol = string
#         ports    = list(string)
#       }))
#       deny = list(object({
#         protocol = string
#         ports    = list(string)
#       }))
#       log_config = object({
#         metadata = string
#       })
#     }))
#   }))
# }

# variable "routes_list" {
#   description = "Map of routes which needs to be created against a VPC"
#   type = map(object({
#     vpc_name   = string
#     project_id = string
#     routes     = list(map(string))
#   }))
# }

# // Variable for billing alert
# variable "thresholds" {
#   description = "thresholds for budget"
#   type = list(object({
#     percentage = number,
#     basis      = string
#   }))
#   default = []
# }

# # variable "amount" {
# #   description = "The amount to use as the budget"
# #   type        = number
# # }

# variable "notification_project_id" {
#   description = "common service project id of notification cannel"
#   type        = string
# }

# variable "notification_type" {
#   description = "type of notification email/slack"
#   type        = string
# }

# variable "notification_email" {
#   description = "list of email"
#   type        = string
# }

# // Variable for private service connection
# variable "private_service_connection" {
#   description = "private service connection variable"
#   type = map(object({
#     address       = string
#     vpc_name      = string
#     name          = string
#     prefix_length = number
#   }))
# }


# variable "cloud_nat" {
#   description = "variable to create cloud nat "
#   type = list(object({
#     project_id                         = string
#     router_network                     = string
#     region                             = string
#     nat_name                           = string
#     router_name                        = string
#     static_ip_name                     = list(string)
#     create_router                      = bool
#     source_subnetwork_ip_ranges_to_nat = string
#     subnetworks = list(object({
#       name                     = string,
#       source_ip_ranges_to_nat  = list(string)
#       secondary_ip_range_names = list(string)
#     }))
#   }))
#   default = []
# }


# variable "reserve_static_ip" {
#   description = "reserve ip"
#   type = list(object({
#     name         = string
#     project_id   = string
#     region       = string
#     address_type = string
#   }))
# }

// Variable for cloud dns creation
variable "cloud_dns" {
  description = "List of Private dns"
  type = list(object({
    type   = string
    name   = string
    domain = string
    recordsets = list(object({
      name    = string,
      type    = string,
      ttl     = number,
      records = list(string)
    }))
  }))
  default = []
}

variable "network_self_link" {
  description = "Self link of the network that will be allowed to query the zone."
  default     = []
}