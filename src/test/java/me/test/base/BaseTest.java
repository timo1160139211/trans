/*
 * file_name: BaseTest.java
 *
 * Copyright GaoYisheng Corporation 2017
 *
 * License：
 * date： 2017年10月7日 下午1:22:38
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

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.web.context.WebApplicationContext;

/**
 * 通用测试类
 * 
 * @author gaoyisheng
 */
@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = { "classpath:spring-mybatis.xml" })
@WebAppConfiguration
public class BaseTest {

	@Autowired
	protected WebApplicationContext wac;


	@Test
	public void test() {}

}
