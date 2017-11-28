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

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import site.gaoyisheng.pojo.*;
import site.gaoyisheng.service.*;

@Controller
@RequestMapping("/user")
public class UserOpsController {
	@Autowired
	private UserService userService;
	
	@Autowired
	private ThesisService thesisService;
	
	@Autowired
	private PatentService patentService;
	
	@Autowired
	private ChPeriodicalThesisService chPeriodicalThesisService;
	
	@Autowired
	private EnPeriodicalThesisService enPeriodicalThesisService;
	
    /**
     * 返回论文列表. 
     * 参数: 用户姓名. 
     * 返回: 论文列表模型.
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
    
    @RequestMapping(value = "/awards-list" ,method = RequestMethod.GET)
    public String toAwardsList(){
        return "/user/awards-list";
    }
    
    @RequestMapping(value = "/search" ,method = RequestMethod.GET)
    public String searchUser(){
        return "/user/like-search";
    }
        
    /** 
     * .
     * TODO 返回 成果 列表.  request.getParameter("awardsType")参数 {patent,enPeriodicalThesis,chPeriodicalThesis}
     * @param request
     * @return
     */
    @RequestMapping(value = "/awards-list" ,method = RequestMethod.POST)
    @ResponseBody
    public Object awardsList(HttpServletRequest request) {
        Map<String,String> map = new HashMap<String,String>();
    	 map.put("name", request.getParameter("name"));
    	 map.put("provenance", request.getParameter("provenance"));
    	 map.put("period", request.getParameter("period"));
    	 map.put("year", request.getParameter("year"));
    	 map.put("subject", request.getParameter("subject"));
    	 map.put("volume", request.getParameter("volume"));
    	 map.put("page", request.getParameter("page"));
    	 map.put("type", request.getParameter("type"));
    	 map.put("authorizationNumber", request.getParameter("authorizationNumber"));
    	 map.put("authorizationDate", request.getParameter("authorizationDate"));
    	 map.put("pctPatentOrNot", request.getParameter("pctPatentOrNot"));
    	 map.put("pctPatentName", request.getParameter("pctPatentName"));
    	 map.put("pctPatentApplicationNumber", request.getParameter("pctPatentApplicationNumber"));
    	 map.put("pctPatentApplicationDate", request.getParameter("pctPatentApplicationDate"));
    	 map.put("pctPatentPriorityDate", request.getParameter("pctPatentPriorityDate"));
    	 map.put("inCountry", request.getParameter("inCountry"));
    	 map.put("autherName", request.getParameter("autherName"));
    	 map.put("claimStatus", request.getParameter("claimStatus"));
        
    	 switch(request.getParameter("awardsType")) {
              //插入并返回 提示
            case "patent": return patentService.selectByMultiConditions(map);
            case "enPeriodicalThesis": return chPeriodicalThesisService.selectByMultiConditions(map);
            case "chPeriodicalThesis": return enPeriodicalThesisService.selectByMultiConditions(map);
            default : return null;
         }
    }
	
    /**
     * 认领. 参数:
     *
     * 返回:
     *
     *
     * TODO
     *
     * @param request
     * @return
     */
    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String home(HttpServletRequest request) {
    		return "/user/home";
    }
        
    /**
     * .
     * TODO 认领      request.getParameter("awardsType")参数 {patent,enPeriodicalThesis,chPeriodicalThesis}
     * @param request
     * @return
     * @throws UnsupportedEncodingException
     */
    @RequestMapping(value = "/claim", method = RequestMethod.POST)
    public ModelAndView claim(HttpServletRequest request,
    		@ModelAttribute Patent patent,
    		@ModelAttribute EnPeriodicalThesis enPeriodicalThesis,
    		@ModelAttribute ChPeriodicalThesis chPeriodicalThesis)  {
        
        switch(request.getParameter("awardsType")) {
            case "patent": patentService.updateByPrimaryKeySelective(patent);break;
            case "enPeriodicalThesis":  enPeriodicalThesisService.updateByPrimaryKeySelective(enPeriodicalThesis);break;
            case "chPeriodicalThesis":  chPeriodicalThesisService.updateByPrimaryKeySelective(chPeriodicalThesis);break;
            default : break;
         }
        
        ModelAndView mv = new ModelAndView();
        mv.setViewName("redirect:/awards-list");
        return mv;
    }
    
    /**
     * 根据表单后面的认领按钮提交对应的id返回相应的表单填写页面
     * @param request
     * @return 
     */
    @RequestMapping(value = "/options-contant", method = RequestMethod.POST)
    public ModelAndView optionsContant(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        
        switch(request.getParameter("awardsType")) {
            case "patent": mv.addObject("thesis", patentService.selectByPrimaryKey(Integer.valueOf(request.getParameter("id"))));break;
            case "enPeriodicalThesis":  mv.addObject("thesis",enPeriodicalThesisService.selectByPrimaryKey(Integer.valueOf(request.getParameter("id"))));break;
            case "chPeriodicalThesis": mv.addObject("thesis", chPeriodicalThesisService.selectByPrimaryKey(Integer.valueOf(request.getParameter("id"))));break;
        default : break;
         }
        
        mv.setViewName("user/options-contant");
        return mv;
    }
	
    /**
     * .
     * 填写修改个人信息表单. TODO
     *
     * @param request
     * @return
     */
    @RequestMapping("/user-edit-form")
    public ModelAndView editUser(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        User selectedUser = (User) session.getAttribute("currentUser");
        ModelAndView mv = new ModelAndView();
        mv.addObject("selectedUser", selectedUser)
           .setViewName("/user/user-edit-form");
        return mv;
    }
    
    @RequestMapping(value = "/user-update", method = RequestMethod.GET)
    public String updateUser() {
        return "/user/modify";
    }
	
    /**
     * .
     * 提交表单,更新数据库,更改session用户. TODO
     *
     * @param userForm
     * @param request
     * @return
     */
    @RequestMapping(value = "/user-update", method = RequestMethod.POST)
    public void updateUser(User userForm, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        User selectedUser = (User) session.getAttribute("currentUser");
        userForm.setId(selectedUser.getId());
        userService.updateByPrimaryKeySelective(userForm);
        session.setAttribute("currentUser", userForm);
    }
	
    /**
     * .
     * TODO 模糊查找一个用户.
     * @return
     */
    @RequestMapping(value = "/search", method = RequestMethod.POST)
    @ResponseBody
    public Object fuzzySearchUser(@RequestParam("name")String name){
    	User u = new User();
    	//非空判断 => 设值 用于查询.
    	u.setName(name);
    	return userService.searchUserFuzzyQuery(u);
    } 
	
	/**
	 * .
	 * 设置认领属性.(无路径映射)
	 * TODO
	 * @param thesis
	 * @param user
	 * @param no
	 * @return
	 */
	 private Thesis setProperties(Thesis thesis,User user,Integer no,Integer sdutNumber) {
		
		System.out.println("我是被认领的 论文:"+thesis.getName());
		System.out.println("--<<认领前:" + thesis.toString());
		
		//修改 thesis 的四个值  1:理工大学职工参与人数: 
		thesis.setSdutAutherNumber(sdutNumber);
		
		//修改 thesis 的四个值  2:认领人的信息: 
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
		
		//修改 thesis 的四个值  3:标志位自增1: 
		//每修改一次自增 1
		thesis.setAutherNumber(thesis.getAutherNumber()+1);
		
		//修改 thesis 的四个值  1:认领进度 : (false:认领完成)  
		//如果值相等，则置不可见:false
		if (thesis.getSdutAutherNumber()==thesis.getAutherNumber()) {
			thesis.setStatus("false");
		}
		
		System.out.println("-->>认领后:" + thesis.toString());
		
		return thesis;
	}
}
