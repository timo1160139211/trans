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

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import site.gaoyisheng.pojo.ChPeriodicalThesis;
import site.gaoyisheng.pojo.EnPeriodicalThesis;
import site.gaoyisheng.pojo.Patent;
import site.gaoyisheng.pojo.User;
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
	
    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String home() {
        return "/secretary/home";
    }
    
	@RequestMapping(value="/audit-list",method = RequestMethod.GET)
	public String auditList(){
		return "/secretary/audit-list";
	}
	
    /** 
     * .
     * TODO 返回 成果 详细.  
     * @param request
     * @return
     */
    @RequestMapping(value = "/detaile" ,method = RequestMethod.GET,produces = "application/json; charset=utf-8")
    @ResponseBody
    public Object awardsDetaile(HttpServletRequest request){
    	int id = Integer.valueOf(request.getParameter("id"));
    	
       switch(request.getParameter("awardsType")) {
           case "patent": return patentService.selectByPrimaryKey(id);
           case "chPeriodicalThesis": return chPeriodicalThesisService.selectByPrimaryKey(id);
           case "enPeriodicalThesis": return enPeriodicalThesisService.selectByPrimaryKey(id);
           default : return "{\"msg\":\"数据错误,再试一次\"}";
        }
    }
	
    /** 
     * .
     * TODO 返回 成果 列表.  request.getParameter("awardsType")参数 {patent,enPeriodicalThesis,chPeriodicalThesis}
     * @param request
     * @return
     */
    @RequestMapping(value = "/audit-list" ,method = RequestMethod.POST)
    @ResponseBody
    public Object awardsList(HttpServletRequest request) {
        Map<String,String> map = new HashMap<String,String>();
        map.put("keyId", request.getParameter("keyId"));
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
    	 map.put("no10AutherNumber", request.getParameter("no10AutherNumber"));//审核状态
    	 map.put("no10AutherName", request.getParameter("no10AutherName"));//学院
        
    	 //分页参数
    	 int pageNum = Integer.valueOf(request.getParameter("pageNum"));
    	 int pageSize = 30;
    	 
    	 switch(request.getParameter("awardsType")) {
            case "patent": PageHelper.startPage(pageNum,pageSize);return new PageInfo<Patent>(patentService.selectByMultiConditions(map));
            case "chPeriodicalThesis": PageHelper.startPage(pageNum,pageSize);return new PageInfo<ChPeriodicalThesis>(chPeriodicalThesisService.selectByMultiConditions(map));
            case "enPeriodicalThesis": PageHelper.startPage(pageNum,pageSize);return new PageInfo<EnPeriodicalThesis>(enPeriodicalThesisService.selectByMultiConditions(map));
            default : return null;
         }
    }
    
    
    
	@RequestMapping(value="/audit",method = RequestMethod.GET)
	public String auditPage(){
		return "/secretary/audit";
	}
	
	@RequestMapping(value="/audit",method = RequestMethod.POST,produces = "application/json; charset=utf-8")//解决中文??问题
   @ResponseBody
	public Object audit(HttpServletRequest request){
		
		int id = Integer.valueOf(request.getParameter("id"));
		String btnType = request.getParameter("btnType");
		
		String update = "";
		if(btnType.equals("pass")) {update="通过审核";}
		if(btnType.equals("notPass")) {update="未通过审核";}
		
		int status = 0;
		switch(request.getParameter("awardsType")) {
        case "patent": status = patentService.updateByPrimaryKeySelective(new Patent(id,update));break;
        case "chPeriodicalThesis":status = chPeriodicalThesisService.updateByPrimaryKeySelective(new ChPeriodicalThesis(id,update));break;
        case "enPeriodicalThesis":status = enPeriodicalThesisService.updateByPrimaryKeySelective(new EnPeriodicalThesis(id,update));break;
		}	
		
		if(status == 1) {
			return "{\"status\":" + "\"审核成功\"}";
		}else {
			return "{\"status\":" + "\"审核失败\"}";
		}
	}
	
	
    @RequestMapping(value = "/secretary-update", method = RequestMethod.GET)
    public String updateUser() {
        return "/secretary/modify";
    }
    
    /**
     * .
     * 提交表单,更新数据库,更改session用户. TODO
     *
     * @param userForm
     * @param request
     * @return
     */
    @RequestMapping(value = "/secretary-update", method = RequestMethod.POST)
    @ResponseBody
    public Object updateUser(@RequestParam("password")String password, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        User selectedUser = (User) session.getAttribute("currentUser");
        
        User userForm=new User();
        userForm.setId(selectedUser.getId());
        userForm.setPassword(password);
        int flag = userService.updateByPrimaryKeySelective(userForm);
      
		return flag;
    }
    
}


