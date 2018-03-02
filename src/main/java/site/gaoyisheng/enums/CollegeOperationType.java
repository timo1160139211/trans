/*
 * file_name: collegeOperationType.java
 *
 * Copyright GaoYisheng Corporation 2017
 *
 * License：
 * date： 2018年3月2日 下午8:21:48
 *       https://www.gaoyisheng.site
 *       https://github.com/timo1160139211
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package site.gaoyisheng.enums;

public enum CollegeOperationType {

	CREATE("create"),UPDATE("update");
	
	private String name;
	private CollegeOperationType(String name) {
		
	}
	
	@Override
	public String toString() {
		return name;
	}
}
