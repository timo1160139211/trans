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

import java.lang.reflect.Field;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
     * 返回论文列表. 参数: 用户姓名. 返回: 论文列表模型.
     *
     * TODO
     *
     * @param request
     * @return
     */
    @RequestMapping("/thesis-list")
    @ResponseBody
    public Object thesisList(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        User currentUser = (User) session.getAttribute("currentUser");
        return thesisService.selectAllThesisLikeUserNameAndNumber(currentUser);
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
	@RequestMapping(value = "/claim", method = RequestMethod.POST)
	public ModelAndView claim(HttpSession session,
			@RequestParam(value = "thesisId", required = true) Integer thesisId,
			@RequestParam(value = "sdutNumber", required = true) Integer sdutNumber,
			@RequestParam(value = "no", required = true) Integer no) {
		
		User currentUser =(User) session.getAttribute("currentUser");
		Thesis thesisBefore = thesisService.selectByPrimaryKey(thesisId);
		
		//传值，设值:
		Thesis thesisAfter = setProperties(thesisBefore,currentUser,no,sdutNumber) ;
		
		thesisService.updateByPrimaryKeySelective(thesisAfter);
		
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
	public ModelAndView updateUser(@ModelAttribute User userForm,HttpSession session) {
		userService.updateByPrimaryKeySelective(userForm);
		session.setAttribute("currentUser", userForm);
		
		return new ModelAndView("/home");
	}
	
	
	/**
	 * .
	 * 设置认领属性.
	 * TODO
	 * @param thesis
	 * @param user
	 * @param no
	 * @return
	 */
	public Thesis setProperties(Thesis thesis,User user,Integer no,Integer sdutNumber) {
		
		System.out.println("我是被认领的 论文:"+thesis.getName());
		System.out.println("--<<认领前:" + thesis.toString());
		
		//修改 thesis 的三个值
		thesis.setSdutAutherNumber(sdutNumber);
		
		//设置对应字段:
		switch(no){
			case 1:thesis.setNo1AutherName(user.getName());thesis.setNo1AutherNumber(user.getNumber());break;
			case 2:thesis.setNo2AutherName(user.getName());thesis.setNo2AutherNumber(user.getNumber());break;
			case 3:thesis.setNo3AutherName(user.getName());thesis.setNo3AutherNumber(user.getNumber());break;
			case 4:thesis.setNo4AutherName(user.getName());thesis.setNo4AutherNumber(user.getNumber());break;
			case 5:thesis.setNo5AutherName(user.getName());thesis.setNo5AutherNumber(user.getNumber());break;
			case 6:thesis.setNo6AutherName(user.getName());thesis.setNo6AutherNumber(user.getNumber());break;
			case 7:thesis.setNo7AutherName(user.getName());thesis.setNo7AutherNumber(user.getNumber());break;
			case 8:thesis.setNo8AutherName(user.getName());thesis.setNo8AutherNumber(user.getNumber());break;
			case 9:thesis.setNo9AutherName(user.getName());thesis.setNo9AutherNumber(user.getNumber());break;
			case 10:thesis.setNo10AutherName(user.getName());thesis.setNo10AutherNumber(user.getNumber());break;
		}
		
		//每修改一次自增 1
		thesis.setAutherNumber(thesis.getAutherNumber()+1);
		
		//如果值相等，则置不可见:false
		if (thesis.getSdutAutherNumber()==thesis.getAutherNumber()) {
			thesis.setStatus("false");
		}
		
		System.out.println("-->>认领后:" + thesis.toString());
		
		return thesis;
	}
}
