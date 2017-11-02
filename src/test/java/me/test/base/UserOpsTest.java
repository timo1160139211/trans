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

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import site.gaoyisheng.pojo.Thesis;
import site.gaoyisheng.service.ThesisService;

public class UserOpsTest extends BaseTest {

	@Autowired
	private ThesisService ts;

	@Test
	public void loginTest() {

		String name = "1";

//		List<Thesis> thesisList = ts.selectAllThesisLikeUserName(name);

		List<Thesis> thesisList = ts.selectAllThesis();
		
		for (Thesis t : thesisList) {
			System.out.println(t.toString());

		}
	}
}
