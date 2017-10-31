/*
 * file_name: AchievementOpsTest.java
 *
 * Copyright GaoYisheng Corporation 2017
 *
 * License：
 * date： 2017年10月7日 下午8:45:40
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
import site.gaoyisheng.pojo.Achievement;
import site.gaoyisheng.service.AchievementService;

public class AchievementOpsTest extends BaseTest {
	
	@Autowired
	private AchievementService as;

	@Test
	public void selectByStudentId() {
		List<Achievement> achievements = as.selectByStudentId(1);
		if (achievements != null) {
			for (Achievement a :  achievements ) {
				System.out.println(a.toString());
			}
		}
	}
	
	@Test
	public void selectByQuestionId() {
		List<Achievement> achievements = as.selectByQuestionId(1);
		if (achievements != null) {
			for (Achievement a :  achievements ) {
				System.out.println(a.toString());
			}
		}
	}
}
