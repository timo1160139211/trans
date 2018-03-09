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

public class ResultUtil<T> {

	/**
	 * .
	 * 成功
	 * @param t
	 * @return
	 */
	public ResultModel<T> success(T t) {
		ResultModel<T> result = new ResultModel<T>();
		result.setCode(ResultEnum.SUCCESS.getCode());
		result.setMsg(ResultEnum.SUCCESS.getName());
		result.setData(t);
		return result;
	}
	
	/**
	 * .
	 * 成功
	 * @param t
	 * @param msg
	 * @return
	 */
	public ResultModel<T> success(T t, String msg) {
		ResultModel<T> result = new ResultModel<T>();
		result.setCode(ResultEnum.SUCCESS.getCode());
		result.setMsg(msg);
		result.setData(t);
		return result;
	}
	
	/**
	 * .
	 * 失败
	 * @param t
	 * @return
	 */
	public ResultModel<T> error(T t) {
		ResultModel<T> result = new ResultModel<T>();
		result.setCode(ResultEnum.ERROR.getCode());
		result.setMsg(ResultEnum.ERROR.getName());
		result.setData(t);
		return result;
	}
	
	/**
	 * .
	 * 失败
	 * @param t
	 * @param msg
	 * @return
	 */
	public ResultModel<T> error(T t, String msg) {
		ResultModel<T> result = new ResultModel<T>();
		result.setCode(ResultEnum.ERROR.getCode());
		result.setMsg(msg);
		result.setData(t);
		return result;
	}
}
