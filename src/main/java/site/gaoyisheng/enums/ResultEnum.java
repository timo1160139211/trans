/*
 * file_name: ResultEnum.java
 *
 * Copyright GaoYisheng Corporation 2017
 *
 * License：
 * date： 2018年3月9日 下午9:07:13
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

public enum ResultEnum {

	UNKOWN_ERROR(-1,"未知错误"),
	SUCCESS(1,"成功"),
	ERROR(0,"错误");
	
	private String name;
	private int code;

	ResultEnum(int code, String msg) {
		this.code = code;
		this.name = msg;
	}

	public String getName() {
		return name;
	}

	public int getCode() {
		return code;
	}
	
}
