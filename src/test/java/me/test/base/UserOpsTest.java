/*
 * file_name: UserOpsTest.java
 *
 * Copyright GaoYisheng Corporation 2017
 *
 * License：
 * date： 2017年11月2日 下午9:43:07
 *       https://www.gaoyisheng.site
 *       https://github.com/timo1160139211
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package me.test.base;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import site.gaoyisheng.pojo.EnPeriodicalThesis;
import site.gaoyisheng.pojo.Patent;
import site.gaoyisheng.pojo.Thesis;
import site.gaoyisheng.pojo.User;
import site.gaoyisheng.service.EnPeriodicalThesisService;
import site.gaoyisheng.service.PatentService;
import site.gaoyisheng.service.ThesisService;
import site.gaoyisheng.service.UserService;

public class UserOpsTest extends BaseTest {

	@Autowired
	private EnPeriodicalThesisService ts;
	
	@Autowired
	private PatentService ps;
	
	@Autowired
	private UserService us;

/*	@Test
	public void loginTest() {

		User user = new User();
		user.setName("陈鹏");
		user.setNumber("123");
		
		List<Thesis> thesisList = ts.selectAllThesisLikeUserNameAndNumber(user);

//		List<Thesis> thesisList = ts.selectAllThesis();
		
		for (Thesis t : thesisList) {
			System.out.println(t.toString());

		}
	}
*/
	
/*	@Test
	public void updateTest() {
		Thesis thesis = new Thesis();

		//注掉此行 将没有数据被更新:
//		thesis.setId(3);
		thesis.setName("haha");
		thesis.setNo10AutherName("haha2");
		
		ts.updateByPrimaryKeySelective(thesis);
	}
*/
	@Test
	public void selectTest() {
//		User u = new User();
//		u.setName("e");
//		List<User> userList = us.searchUserFuzzyQuery(u);
//		for (User user : userList) {
//			System.out.println(user.toString());
//
//		}
		
//		Map<String,String> map = new HashMap<String,String>();
//		
////		map.put("name", "1");
//		
//		List<Patent> patentList = ps.selectByMultiConditions(map);
//		for (Patent p : patentList) {
//			System.out.println(p.toString());
//
//		}
		
		//System.out.println(ts.selectByPrimaryKey(101));
		
//		List<EnPeriodicalThesis> list = ts.selectByStatus("未认领");
//		for (EnPeriodicalThesis e : list) {
//			System.out.println(e.toString());
//		}
		
		
//		Map<String,Integer> map = ts.selectStatistic();
//		
//		System.out.println("**************************** 已认领:"+map.get("claimed").toString());
//		System.out.println("**************************** 未认领:"+map.get("notClaimed").toString());
//		System.out.println("**************************** 总数  :"+map.get("total").toString());
		
		
		
	}	
	
	@Test
	public void insertListTest() {
//		List<EnPeriodicalThesis> thesisList = new ArrayList<EnPeriodicalThesis>();
//		List<User> thesisList = new ArrayList<User>();
//		
//		User t1 = new User();
//		User t2 = new User();
//		
//		t1.setName("qq1");
//		t2.setName("ww2");
//		
//		thesisList.add(t1);
//		thesisList.add(t2);
//		
//		try {
//			System.out.println(us.insertList(thesisList));
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
	}

}
