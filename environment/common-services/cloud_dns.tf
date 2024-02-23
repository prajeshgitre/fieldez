
/**
 * Copyright 2022 Niveus Solutions Pvt. Ltd.
 *
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// DATA Block for fetching network self link url
data "google_compute_network" "network" {
  name    = "vpc-common-srv-single-01"
  project = "prj-common-srv-single-01"
}

module "cloud-dns" {
  source                             = "/home/prajesh/Documents/Fieldez-migration/modules/terraform-google-cloud-dns"
  for_each                           = { for dns in var.cloud_dns : dns.name => dns }
  project_id                         = var.host_project_id
  type                               = each.value.type
  name                               = each.value.name
  domain                             = each.value.domain
  private_visibility_config_networks = [data.google_compute_network.network.self_link]
  recordsets                         = each.value.recordsets
}
