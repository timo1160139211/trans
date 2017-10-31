/*
 * file_name: LoginTest.java
 *
 * Copyright GaoYisheng Corporation 2017
 *
 * License：
 * date： 2017年10月8日 下午2:57:52
 *       https://www.gaoyisheng.site
 *       https://github.com/timo1160139211
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package me.test;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import me.test.base.BaseTest;
import site.gaoyisheng.pojo.User11;
import site.gaoyisheng.service.LoginService;

public class LoginTest extends BaseTest {

	
	@Autowired
	private LoginService ls;
	
	@Test
	public void loginTest() {
		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("number", "15110471070");
		parameterMap.put("password", "123456");
		
		User11 user = ls.selectByNumberAndPassword(parameterMap);
		
		System.out.println(user.toString());
	}
	
}
