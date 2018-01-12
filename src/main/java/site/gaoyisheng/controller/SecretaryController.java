/*
 * file_name: SecretaryController.java
 *
 * Copyright GaoYisheng Corporation 2017
 *
 * License：
 * date： 2018年1月12日 下午1:35:05
 *       https://www.gaoyisheng.site
 *       https://github.com/timo1160139211
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package site.gaoyisheng.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import site.gaoyisheng.service.ChPeriodicalThesisService;
import site.gaoyisheng.service.EnPeriodicalThesisService;
import site.gaoyisheng.service.PatentService;
import site.gaoyisheng.service.UserService;

@Controller
@RequestMapping("/secretary")
public class SecretaryController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private PatentService patentService;

	@Autowired
	private EnPeriodicalThesisService enPeriodicalThesisService;
  
	@Autowired
	private ChPeriodicalThesisService chPeriodicalThesisService;
	
	@RequestMapping(value="/audit",method = RequestMethod.GET)
	public String audit(){
		return "/secretary/audit";
	}
}


