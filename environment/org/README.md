###### terraform-folders   

This module helps create several folders under the same parent with a common naming convention.

The resources/services/activations/deletions that this module will create/trigger are:

- Create folders with the provided names

## Compatibility

 This module is meant for use with Terraform 0.13+ and tested using Terraform 1.0+. If you find incompatibilities using Terraform >=0.13, please open an issue.
 If you haven't [upgraded](https://www.terraform.io/upgrade-guides/0-13.html)
  and need a Terraform 0.12.x-compatible version of this module, the last released version intended for
  Terraform 0.12.x is [2.0.2](https://registry.terraform.io/modules/terraform-google-modules/folders/google/2.0.2).

## Usage

Basic usage of this module is as follows:

```hcl
module "folders" {
  source = "../../modules/terraform-google-folders"
  parent = format("%s/%s", var.parent_type, var.parent_id)
  names  = var.folders
}

```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| names | Folder names. | `list(string)` | `[]` | no |
| parent | The resource name of the parent Folder or Organization. Must be of the form folders/folder\_id or organizations/org\_id | `string` | n/a | yes |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

# Google Cloud Organization Policy Terraform Module

This Terraform module makes it easier to manage [organization policies](https://cloud.google.com/resource-manager/docs/organization-policy/overview) for your Google Cloud environment, particularly when you want to have exclusion rules. This module will allow you to set a top-level org policy and then disable it on individual projects or folders easily.

## Compatibility
This module is meant for use with Terraform 0.13+ and tested using Terraform 1.0+. If you find incompatibilities using Terraform >=0.13, please open an issue.
 If you haven't
[upgraded](https://www.terraform.io/upgrade-guides/0-13.html) and need a Terraform
0.12.x-compatible version of this module

## Usage

```hcl
//Module for implementing Org policies
module "org-policy" {
  source            = "../../modules/terraform-google-org-policy"
  for_each          = { for x in var.org-policy : x.constraint => x }
  constraint        = each.value.constraint
  policy_type       = each.value.policy_type
  policy_for        = each.value.policy_for
  organization_id   = each.value.organization_id
  folder_id         = each.value.folder_id
  project_id        = each.value.project_id
  enforce           = each.value.enforce
  allow             = each.value.allow
  allow_list_length = each.value.allow_list_length
  exclude_folders   = each.value.exclude_folders
  exclude_projects  = each.value.exclude_projects
}
```

### Variables
To control module's behavior, change variables' values regarding the following:

- `constraint`: set this variable with the [constraint value](https://cloud.google.com/resource-manager/docs/organization-policy/org-policy-constraints#available_constraints) in the form `constraints/{constraint identifier}`. For example, `constraints/serviceuser.services`
- `policy_type`: Specify either `boolean` for boolean policies or `list` for list policies. (default `list`)
- Policy Root: set one of the following values to determine where the policy is applied:
  - `organization_id`
  - `project_id`
  - `folder_id`
- `exclude_folders`: a list of folder IDs to be excluded from this policy. These folders must be lower in the hierarchy than the policy root.
- `exclude_projects`: a list of project IDs to be excluded from this policy. They must be lower in the hierarchy than the policy root.
- Boolean policies (with `policy_type: "boolean"`) can set the following variables:
  - `enforce`: if `true` or `null` then the policy is enforced at the root; if `false` then policy is not enforced at the root. (default `null`)
- List policies (with `policy_type: "list"`) can set **one of** the following variables. Only one may be set.
  - `enforce`: if `true` or `null` then policy will deny all; if `false` then policy will allow all (default `null`)
  - `allow`: list of values to include in the policy with ALLOW behavior. Set `enforce` to `null` to use it.
  - `deny`: list of values to include in the policy with DENY behavior. Set `enforce` to `null` to use it.
- List policies with allow or deny values require the length to be set (a workaround for [this terraform issue](https://github.com/hashicorp/terraform/issues/10857))
  - `allow_list_length`
  - `deny_list_length`

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| allow | (Only for list constraints) List of values which should be allowed | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| allow\_list\_length | The number of elements in the allow list | `number` | `0` | no |
| constraint | The constraint to be applied | `string` | n/a | yes |
| deny | (Only for list constraints) List of values which should be denied | `list(string)` | <pre>[<br>  ""<br>]</pre> | no |
| deny\_list\_length | The number of elements in the deny list | `number` | `0` | no |
| enforce | If boolean constraint, whether the policy is enforced at the root; if list constraint, whether to deny all (true) or allow all | `bool` | `null` | no |
| exclude\_folders | Set of folders to exclude from the policy | `set(string)` | `[]` | no |
| exclude\_projects | Set of projects to exclude from the policy | `set(string)` | `[]` | no |
| folder\_id | The folder id for putting the policy | `string` | `null` | no |
| organization\_id | The organization id for putting the policy | `string` | `null` | no |
| policy\_for | Resource hierarchy node to apply the policy to: can be one of `organization`, `folder`, or `project`. | `string` | n/a | yes |
| policy\_type | The constraint type to work with (either 'boolean' or 'list') | `string` | `"list"` | no |
| project\_id | The project id for putting the policy | `string` | `null` | no |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements
### Terraform plugins
- [Terraform](https://www.terraform.io/downloads.html) >= 0.13.0
- [terraform-provider-google](https://github.com/terraform-providers/terraform-provider-google) >= v2.5.0

### Permissions
In order to execute this module, the Service Account you run as must have the **Organization Policy Administrator** (`roles/orgpolicy.PolicyAdmin`) role.



