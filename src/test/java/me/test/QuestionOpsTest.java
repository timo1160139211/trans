/*
 * file_name: QuestionOpsTest.java
 *
 * Copyright GaoYisheng Corporation 2017
 *
 * License：
 * date： 2017年10月7日 下午7:12:17
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
import site.gaoyisheng.pojo.Question;
import site.gaoyisheng.service.QuestionService;

public class QuestionOpsTest extends BaseTest {
	
	@Autowired
	private QuestionService qs;

	@Test
	public void selectByTeamId() {
		List<Question> questions = qs.selectByTeamId(1);
		if (questions != null) {
			for (Question q : questions) {
				System.out.println(q.toString());
			}
		}
	}
}
