/*
 * Copyright 2023 Niveus Solutions Pvt. Ltd.
 *
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


# // Terraform Module for creation of Folders in organization
# module "folders" {
#   source = "../../modules/terraform-google-folders"
#   parent = format("%s/%s", var.parent_type, var.parent_id)
#   names  = var.folders
# }
