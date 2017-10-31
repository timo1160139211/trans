/*
 * file_name: UserOpsTest.java
 *
 * Copyright GaoYisheng Corporation 2017
 *
 * License：
 * date： 2017年10月7日 下午2:12:26
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
import org.springframework.beans.factory.annotation.Autowired;

import me.test.base.BaseTest;
import site.gaoyisheng.pojo.User11;
import site.gaoyisheng.pojo.User11;
import site.gaoyisheng.service.UserService;

public class UserOpsTest extends BaseTest {

	@Autowired
	private UserService us;

//	@Test
//	public void selectAllUserTest() {
//		List<User> users = us.selectAllUser();
//		if (users != null) {
//			for (User u : users) {
//				System.out.println(u.toString());
//			}
//		}
//	}
	
//	@Test
//	public void selectAllUserByIdentityTest() {
//		List<User> users = us.selectAllUserByIdentity("student");
//		if (users != null) {
//			for (User u : users) {
//				System.out.println(u.toString());
//			}
//		}
//	}

//	@Test
//	public void testSelectByTeamId() {
//		List<User> users = us.selectByTeamId(1);
//		if (users != null) {
//			for (User u : users) {
//				System.out.println(u.toString());
//			}
//		}
//	}
	
	@Test
	public void testSelectByTeacherIdAndTeamId() {
		
		List<UserTeamForm> users = us.selectByTeacherIdAndTeamId(2,null);
		if (users != null) {
			for (UserTeamForm u : users) {
				System.out.println(u.toString());
			}
		}
	}
//	@Test
//	public void selectAllUserExceptIdentityTest() {
//		List<User> users = us.selectAllUserExceptIdentity("student");
//		if (users != null) {
//			for (User u : users) {
//				System.out.println(u.toString());
//			}
//		}
//	}
	
//	@Test
//	public void InsertReturnIdTest() {
//		
//		User user = new User();
//		
//		user.setNumber("9998877");
//		user.setPassword("123456");
//		user.setIdentity("student");
//		user.setName("woshishui");
//		user.setIdcard("370105199XXXXXXXXX");
//		user.setTeamId(1);
//		user.setEmail("hahaha@qq.com");
//		
//		int i = us.insertCacheId(user);
//		
//		System.out.println(user.toString());
//		System.out.println("----------------"+i);
//
//		
//	}
	
//	@Test
//	public void updateTest() {
//		
//		User user = new User();
//		
//		user.setId(121);
//		user.setNumber("15110471010");
//		user.setPassword("123456");
//		user.setIdentity("student");
//		user.setName("woshishui");
//		user.setIdcard("370105199XXXXXXXXX");
//		user.setTeamId(1);
//		user.setEmail("hahaha@qq.com");
//		
//		int i = us.updateByPrimaryKey(user);
//		
//		System.out.println(user.toString());
//		
//	}
	
//	@Test
//	public void deleteTest() {
//		
//		us.deleteByPrimaryKey(140);
//	}

}
