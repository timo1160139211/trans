/*
 * file_name: ResultModel.java
 *
 * Copyright GaoYisheng Corporation 2017
 *
 * License：
 * date： 2018年3月9日 下午8:38:16
 *       https://www.gaoyisheng.site
 *       https://github.com/timo1160139211
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package site.gaoyisheng.domain;


public class ResultModel<T> {

	//消息
	private String msg;
	
	//代号
	private int code;
	
	//数据
	private T data;

	public ResultModel() {
		this.msg = "";
		this.code = 0;
		this.data = null;
	}
	
	public ResultModel(String msg, int code, T data) {
		this.msg = msg;
		this.code = code;
		this.data = data;
	}
	
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public T getData() {
		return data;
	}
	public void setData(T data) {
		this.data = data;
	}

	@Override
	public String toString() {
		return "ResultModel [msg=" + msg + ", code=" + code + ", data=" + data + "]";
	}
	
}
