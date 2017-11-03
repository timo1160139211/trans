/*
 * file_name: TeacherOpsController.java
 *
 * Copyright GaoYisheng Corporation 2017
 *
 * License：
 * date： 2017年10月9日 上午10:33:27
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

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import site.gaoyisheng.pojo.Thesis;
import site.gaoyisheng.pojo.User;
import site.gaoyisheng.service.ThesisService;
import site.gaoyisheng.service.UserService;

@Controller
@RequestMapping("/user")
public class UserOpsController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private ThesisService thesisService;
	
	/**
	 * 返回论文列表.
	 *     参数:
	 *         用户姓名.  
	 *     返回:
	 *         论文列表模型.
	 *     
	 * TODO
	 * @param session
	 * @return
	 */
	@RequestMapping("/thesis-list")
	public ModelAndView thesisList(HttpSession session) {
		List<Thesis> thesisList = null;
		
		User currentUser = (User) session.getAttribute("currentUser");
		
		thesisList = thesisService.selectAllThesisLikeUserNameAndNumber(currentUser);
		
		ModelAndView mv = new ModelAndView();
		mv
		  .addObject("thesisList", thesisList)
		  .setViewName("/user/thesis-list");
		
		return mv;
	}
	
	
	/**
	 * 认领.
	 *     参数:
	 * 
	 *     返回:
	 * 
	 * 
	 * TODO
	 * @param session
	 * @return
	 */
	@RequestMapping("/claim")
	public ModelAndView claim(HttpSession session) {
		
		User currentUser =(User) session.getAttribute("currentUser");
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("currentUser",currentUser)
		  .setViewName("/home");
		
		return mv;
	}
	
	
	/**
	 * .
	 * 填写修改个人信息表单.
	 * TODO
	 * @param session
	 * @return
	 */
	@RequestMapping("/user-edit-form}")
	public ModelAndView editUser(HttpSession session) {
		User selectedUser =(User) session.getAttribute("currentUser");
		
		ModelAndView mv = new ModelAndView();
		mv
		  .addObject("selectedUser", selectedUser)
		  .setViewName("/user/user-edit-form");
		
		return mv;
	}
	
	/**
	 * .
	 * 提交表单,更新数据库,更改session用户.
	 * TODO
	 * @param user
	 * @return
	 */
	@RequestMapping("/user-update")
	public ModelAndView updateUser(@ModelAttribute User user,HttpSession session) {
		userService.updateByPrimaryKeySelective(user);
		session.setAttribute("currentUser", user);
		
		return new ModelAndView("/home");
	}
	
	
	
	
	
}
