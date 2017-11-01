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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import site.gaoyisheng.pojo.Thesis;
import site.gaoyisheng.service.ThesisService;

@Controller
@RequestMapping("/user")
public class UserOpsController {

	
	@Autowired
	private ThesisService thesisService;
	
	@RequestMapping("/thesis-list")
	public ModelAndView thesisList(HttpSession session) {
		

		List<Thesis> thesisList = thesisService.selectAllUser();
		
		ModelAndView mv = new ModelAndView();
		mv
		  .addObject("thesisList", thesisList)
		  .setViewName("/user/thesis-list");
		
		return mv;
	}
	
//	@RequestMapping("/home")
//	public ModelAndView home(HttpSession session) {
//		
//		User11 currentUser =(User11) session.getAttribute("currentUser");
//		System.out.println("home:" + currentUser.toString());
//		
//		if(!currentUser.getIdentity().equals("teacher")) {}//如果currentUser 不是teacher
//		
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("currentUser",currentUser)
//		  .setViewName("/" + currentUser.getIdentity() + "/home");
//		
//		return mv;
//	}
//	
//	@RequestMapping("/claim-list")
//	public ModelAndView claimList(HttpSession session) {
//		
//		User11 currentUser =(User11) session.getAttribute("currentUser");
//		System.out.println("home:" + currentUser.toString());
//		
//		if(!currentUser.getIdentity().equals("teacher")) {}//如果currentUser 不是teacher
//		
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("currentUser",currentUser)
//		  .setViewName("/" + currentUser.getIdentity() + "/home");
//		
//		return mv;
//	}
//	
//	@RequestMapping("/claim")
//	public ModelAndView claim(HttpSession session) {
//		
//		User11 currentUser =(User11) session.getAttribute("currentUser");
//		System.out.println("home:" + currentUser.toString());
//		
//		if(!currentUser.getIdentity().equals("teacher")) {}//如果currentUser 不是teacher
//		
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("currentUser",currentUser)
//		  .setViewName("/" + currentUser.getIdentity() + "/home");
//		
//		return mv;
//	}
	
/*	@RequestMapping("/student-list")
	public ModelAndView studentList(HttpSession session,
			                         @RequestParam(name="teamId",required=false)Integer teamId) {
		
		User11 currentUser =(User11) session.getAttribute("currentUser");

		List<Team> teams = teamService.selectByTeacherId(currentUser.getId());
		
		List<UserTeamForm> userTeamFormModels = userService.selectByTeacherIdAndTeamId(currentUser.getId(), teamId);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("userTeamFormModels",userTeamFormModels)
		  .addObject("currentUser", currentUser)
		  .addObject("teams", teams)
		  .setViewName("/teacher/student-list");
		
		return mv;
	}
	
	@RequestMapping("/student-add-form")
	public ModelAndView addSudentForm(HttpSession session) {
		
		User11 currentUser =(User11) session.getAttribute("currentUser");
		
		List<Team> teams = teamService.selectByTeacherId(currentUser.getId());
		ModelAndView mv = new ModelAndView();
		mv.addObject("student", new User11())
		  .addObject("teams", teams)
		  .setViewName("/teacher/student-add-form");
		
		return mv;
	}
	
	@RequestMapping("/student-add")
	public ModelAndView addStudent(@ModelAttribute User11 student) {
		
		student.setIdentity("student");
		userService.insertCacheId(student);
		
		ModelAndView mv = new ModelAndView("redirect:" + "/teacher/student-list");
		
		return mv;
	}
	
	@RequestMapping("/student-delete/{studentId}")
	public ModelAndView deleteStudent(@PathVariable("studentId") Integer studentId) {
		
		userService.deleteByPrimaryKey(studentId);
		
		ModelAndView mv = new ModelAndView("redirect:" + "/teacher/student-list");
		
		return mv;
	}
	
	@RequestMapping("/student-update-form/{studentId}")
	public ModelAndView updateStudentForm(@PathVariable("studentId") Integer studentId,HttpSession session) {
		User11 currentUser =(User11) session.getAttribute("currentUser");

		
		User11 selectedStudent = userService.selectUserByPrimaryKey(studentId);
		List<Team> teams = teamService.selectByTeacherId(currentUser.getId());

		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("selectedStudent", selectedStudent)
		  .addObject("teams", teams)
		  .setViewName("/teacher/student-update-form");
		
		return mv;
	}
	
	@RequestMapping("/student-update")
	public ModelAndView updateStudent(@ModelAttribute User11 student) {
		
		userService.updateByPrimaryKeySelective(student);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:" + "/teacher/student-list");
		
		return mv;
	}
*/	
}
