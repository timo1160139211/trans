/*
 * file_name: MyAppTest.java
 *
 * Copyright GaoYisheng Corporation 2017
 *
 * License：
 * date： 2017年10月7日 下午12:17:47
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
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import me.test.base.BaseTest;
import site.gaoyisheng.pojo.User11;
import site.gaoyisheng.service.impl.UserServiceImpl;

public class MyAppTest extends BaseTest {

	private static final Logger logger = LoggerFactory.getLogger(MyAppTest.class);

	public static void main(String[] args) {
		@SuppressWarnings("resource")
		ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring-mybatis.xml");
		UserServiceImpl us = context.getBean(UserServiceImpl.class);
//		LoginServiceImpl ls = context.getBean(LoginServiceImpl.class);

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("number", "15110471070");
		param.put("password", "123456");

//		User u = us.getUserByPrimaryKey(2);
//		User u1 = ls.selectByNumberAndPassword(param);
//		System.out.println(u.toString());
//		System.out.println(u1.toString());

		List<User11> users = us.selectAllUser();
		if (users != null) {
			for (User11 u11 : users) {
				System.out.println(u11.toString());
			}
		}
	}
	
	@Test
	public void test() {}

}
