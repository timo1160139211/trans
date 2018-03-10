/*
 * file_name: ResultUtil.java
 *
 * Copyright GaoYisheng Corporation 2017
 *
 * License：
 * date： 2018年3月9日 下午8:36:51
 *       https://www.gaoyisheng.site
 *       https://github.com/timo1160139211
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package site.gaoyisheng.utils;


import site.gaoyisheng.domain.ResultModel;
import site.gaoyisheng.enums.ResultEnum;

public class ResultUtil {

	/**
	 * .
	 * 成功
	 * @return
	 */
	@SuppressWarnings({ "rawtypes"})
	public static ResultModel success() {
		ResultModel result = new ResultModel();
		result.setCode(ResultEnum.SUCCESS.getCode());
		result.setMsg(ResultEnum.SUCCESS.getName());
		return result;
	}
	
	/**
	 * .
	 * 成功
	 * @param o
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static ResultModel success(Object o) {
		ResultModel result = new ResultModel();
		result.setCode(ResultEnum.SUCCESS.getCode());
		result.setMsg(ResultEnum.SUCCESS.getName());
		result.setData(o);
		return result;
	}
	
	/**
	 * .
	 * 成功
	 * @param 0
	 * @param msg
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static ResultModel success(Object o, String msg) {
		ResultModel result = new ResultModel();
		result.setCode(ResultEnum.SUCCESS.getCode());
		result.setMsg(msg);
		result.setData(o);
		return result;
	}
	
	/**
	 * .
	 * 失败
	 * @return
	 */
	@SuppressWarnings({ "rawtypes"})
	public static ResultModel error() {
		ResultModel result = new ResultModel();
		result.setCode(ResultEnum.ERROR.getCode());
		result.setMsg(ResultEnum.ERROR.getName());
		return result;
	}
	
	/**
	 * .
	 * 失败
	 * @param o
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static ResultModel error(Object o) {
		ResultModel result = new ResultModel();
		result.setCode(ResultEnum.ERROR.getCode());
		result.setMsg(ResultEnum.ERROR.getName());
		result.setData(o);
		return result;
	}
	
	/**
	 * .
	 * 失败
	 * @param o
	 * @param msg
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static ResultModel error(Object o, String msg) {
		ResultModel result = new ResultModel();
		result.setCode(ResultEnum.ERROR.getCode());
		result.setMsg(msg);
		result.setData(o);
		return result;
	}
}
