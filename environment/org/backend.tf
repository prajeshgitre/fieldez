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

//Backend GCS bucket to store state file for common enviornment resources 

# terraform {
#   backend "gcs" {
#     bucket = "bkt-dra-bootstrap-ase1-terraform-state-lz"
#     prefix = "terraform/org/state"
#   }
# }