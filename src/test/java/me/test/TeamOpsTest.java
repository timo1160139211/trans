/*
 * file_name: TeamOpsTest.java
 *
 * Copyright GaoYisheng Corporation 2017
 *
 * License：
 * date： 2017年10月11日 下午7:44:08
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

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import me.test.base.BaseTest;
import site.gaoyisheng.pojo.Team;
import site.gaoyisheng.service.TeamService;

public class TeamOpsTest extends BaseTest {

	@Autowired
	private TeamService ts;

	@Test
	public void testSelectByTeacherId() {
		List<Team> teams = ts.selectByTeacherId(2);
		if (teams != null) {
			for (Team t : teams) {
				System.out.println(t.toString());
			}
		}
	}

//	@Test
//	public void testInsertCacheId() {
//
//		Team team = new Team();
//		team.setName("三年三班");
//		team.setIntroduce("周杰伦隔壁班");
//		team.setTeacherId(2);
//
//		ts.insertCacheId(team);
//		
//		System.out.println(team.toString());
//	}
	
//	@Test
//	public void testDeleteByPrimaryKey() {
//		ts.deleteByPrimaryKey(123);
//	}
	
}
