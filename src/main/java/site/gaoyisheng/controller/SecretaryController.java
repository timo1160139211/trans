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

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.activation.MimetypesFileTypeMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import site.gaoyisheng.pojo.ChPeriodicalThesis;
import site.gaoyisheng.pojo.EnPeriodicalThesis;
import site.gaoyisheng.pojo.AchievementAward;
import site.gaoyisheng.pojo.OpusAward;
import site.gaoyisheng.pojo.Patent;
import site.gaoyisheng.pojo.Thesis;
import site.gaoyisheng.pojo.User;
import site.gaoyisheng.service.AchievementAwardService;
import site.gaoyisheng.service.ChPeriodicalThesisService;
import site.gaoyisheng.service.EnPeriodicalThesisService;
import site.gaoyisheng.service.OpusAwardService;
import site.gaoyisheng.service.PatentService;
import site.gaoyisheng.service.ThesisService;
import site.gaoyisheng.service.UserService;

@Controller
@RequestMapping("/secretary")
public class SecretaryController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private PatentService patentService;
	
	@Autowired
	private ThesisService thesisService;
	
	@Autowired
	private AchievementAwardService achievementAwardService;
	
	@Autowired
	private OpusAwardService opusAwardService;
	

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
     * 返回 成果 详细.  
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
           case "thesis": return thesisService.selectByPrimaryKey(id);
           case "achievementAward": return achievementAwardService.selectByPrimaryKey(id);
           case "opusAward": return opusAwardService.selectByPrimaryKey(id);
           default : return "{\"msg\":\"数据错误,再试一次\"}";
        }
    }
	
    /** 
     * .
     * 返回 成果 列表.  request.getParameter("awardsType")参数 {patent,enPeriodicalThesis,chPeriodicalThesis}
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
    	 map.put("status", request.getParameter("status"));
    	 map.put("no10AutherNumber", request.getParameter("no10AutherNumber"));//审核状态
    	 map.put("no10AutherName", request.getParameter("no10AutherName"));//学院
        
    	 //分页参数
    	 int pageNum = Integer.valueOf(request.getParameter("pageNum"));
    	 int pageSize = 30;
    	 
    	 switch(request.getParameter("awardsType")) {
            case "patent": PageHelper.startPage(pageNum,pageSize);return new PageInfo<Patent>(patentService.selectByMultiConditions(map));
            case "chPeriodicalThesis": PageHelper.startPage(pageNum,pageSize);return new PageInfo<ChPeriodicalThesis>(chPeriodicalThesisService.selectByMultiConditions(map));
            case "enPeriodicalThesis": PageHelper.startPage(pageNum,pageSize);return new PageInfo<EnPeriodicalThesis>(enPeriodicalThesisService.selectByMultiConditions(map));
            case "achievementAward":  PageHelper.startPage(pageNum,pageSize);return new PageInfo<AchievementAward>(achievementAwardService.selectByMultiConditions(map));
            case "opusAward":  PageHelper.startPage(pageNum,pageSize);return new PageInfo<OpusAward>(opusAwardService.selectByMultiConditions(map));
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
        case "achievementAward":status = achievementAwardService.updateByPrimaryKeySelective(new AchievementAward(id,update));break;
        case "opusAward":status = opusAwardService.updateByPrimaryKeySelective(new OpusAward(id,update));break;
		}	
		
		if(status == 1) {
			return "{\"status\":" + "\"审核成功\"}";
		}else {
			return "{\"status\":" + "\"审核失败\"}";
		}
	}
	
	/**
	 * .
	 * 审核追加数据.
	 * @return
	 */
	@RequestMapping(value="/audit-additional",method = RequestMethod.GET)
	public String toAuditAdditionalPage(){
		return "/secretary/audit-additional";
	}
	
	/**
	 * .
	 * 审核追加数据. 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/audit-additional", method = RequestMethod.POST, produces = "application/json; charset=utf-8") // 解决中文??问题
	@ResponseBody
	public Object auditAdditional(HttpServletRequest request) {

		int id = Integer.valueOf(request.getParameter("id"));
		String btnType = request.getParameter("btnType");

		String update = "";
		if (btnType.equals("pass")) {
			update = "通过审核";
		}
		if (btnType.equals("notPass")) {
			update = "未通过审核";
		}

		if (1 == thesisService.updateByPrimaryKeySelective(new Thesis(id, update)) ) {
			return "{\"status\":" + "\"审核成功\"}";
		} else {
			return "{\"status\":" + "\"审核失败\"}";
		}
	}	
	
	/** 
	 * .
	 * 返回 成果 列表.  
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/audit-additional-list" ,method = RequestMethod.POST,produces = "application/json; charset=utf-8")
	@ResponseBody
	public Object awardsAdditionalList(HttpServletRequest request) {
		Map<String,String> map = new HashMap<String,String>();
		 map.put("keyId", request.getParameter("keyId"));
    	 map.put("name", request.getParameter("name"));
    	 map.put("achievementName", request.getParameter("achievementName"));
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
    	 
    	 map.put("no10AutherNumber", request.getParameter("no10AutherNumber"));//审核状态
    	 map.put("no10AutherName", request.getParameter("no10AutherName"));
        
    	 if(!request.getParameter("awardsType").equals("thesis")) {
    		 map.put("claimStatus", "补录");
    		 map.put("status", "补录");
    	 }else {
    		map.put("status", request.getParameter("status"));
    	 }
    	 //分页参数
    	 int pageNum = Integer.valueOf(request.getParameter("pageNum"));
    	 int pageSize = 30;
    	 
    	 switch(request.getParameter("awardsType")) {
            case "patent": PageHelper.startPage(pageNum,pageSize);return new PageInfo<Patent>(patentService.selectByMultiConditions(map));
            case "thesis": PageHelper.startPage(pageNum,pageSize);return new PageInfo<Thesis>(thesisService.selectByMultiConditions(map));
            case "achievementAward": PageHelper.startPage(pageNum,pageSize);return new PageInfo<AchievementAward>(achievementAwardService.selectByMultiConditions(map));
            case "opusAward": PageHelper.startPage(pageNum,pageSize);return new PageInfo<OpusAward>(opusAwardService.selectByMultiConditions(map));
            default : return null;
         }
	}
	
	
    @RequestMapping(value = "/secretary-update", method = RequestMethod.GET)
    public String updateUser() {
        return "/secretary/modify";
    }
    
    /**
     * .
     * 提交表单,更新数据库,更改session用户. 
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
    
    /**
     * .
     * @param mav
     * @param request
     * @param num
     * @param id
     * @return
     */
    @RequestMapping(value = "/pictureFile/{id}", method = RequestMethod.GET)
    public ModelAndView pictureFile(ModelAndView mav,HttpServletRequest request,
    		@PathVariable("id")int id) {
    	
    	Thesis thesis = thesisService.selectByPrimaryKey(id);
    	
    	mav.setViewName("/secretary/showPicture");
    	mav.addObject("pictureFile1", "/trans/secretary/picture/1/" + id);//new File(file1Path));
    	mav.addObject("pictureFile2", "/trans/secretary/picture/2/" + id);
    	
    	mav.addObject("pictureFile1Name", "" + id + thesis.getWordsNumbers());
    	mav.addObject("pictureFile2Name", "" + id + thesis.getNote());
    	return mav;
    }
    
    /**
     * .
     * @param mav
     * @param request
     * @param response
     * @param num
     * @param id
     */
    @RequestMapping(value = "/picture/{num}/{id}", method = RequestMethod.GET)
    public void getPictureFile(ModelAndView mav,
    		HttpServletRequest request,
    		HttpServletResponse response,
    		@PathVariable("num")int num,
    		@PathVariable("id")int id) {
    	
    	String rootPath = System.getProperty("catalina.home") + "/webapps_data";
    	Thesis thesis = thesisService.selectByPrimaryKey(id);
    	
    	String filePath = "";
    	String fileType = "";
    	if(num ==1) {
    		fileType = thesis.getWordsNumbers();
    		filePath = rootPath + "/" + thesis.getId() + "_1" + fileType;
    	}
    	if(num ==2) {
    		fileType = thesis.getNote();
    		filePath = rootPath + "/" + thesis.getId() + "_2" + fileType;
    	}
    	
    	if("".equals(filePath)) {
    		return ;
    	}
    	
       BufferedInputStream in = null;  
       BufferedOutputStream out = null;  
    	
    	try {
    		File file = new File(filePath);
    		in = new BufferedInputStream(new FileInputStream(file));
    		out = new BufferedOutputStream(response.getOutputStream());
            response.setContentType(new MimetypesFileTypeMap().getContentType(file));// 设置response内容的类型  
            response.setHeader("Content-disposition", "attachment;filename=" + thesis.getId() + "_" + num + fileType);// 设置头部信息  
            byte[] buffer = new byte[10240];  
            int length = 0;  
            while ((length = in.read(buffer)) > 0) {  
                out.write(buffer, 0, length);  
            }  
            out.flush(); 
    	}catch(IOException e) {
    		
    	} finally {  
            try {  
                if (in != null) {  
                    in.close();  
                }  
                if (out != null) {  
                    out.close();  
                }  
            } catch (IOException e) {  
                e.printStackTrace();  
            }  
        }  
    }
    
    /**
     * .
     * 
     * @param request
     * @param response
     * @throws IOException 
     */
//    @RequestMapping(value = "/downloadPictureFile/{num}/{id}", method = RequestMethod.GET)
//    public void downloadPictureFile(HttpServletRequest request,HttpServletResponse response,
//    		@PathVariable("num")int num,
//    		@PathVariable("id")int id) throws IOException {
//    	String rootPath = System.getProperty("catalina.home") + "/webapps_data";
//    	Thesis thesis = thesisService.selectByPrimaryKey(id);
//    	
//    	String filePath = "";
//    	String fileType = "";
//    	if(num ==1) {
//    		fileType = thesis.getWordsNumbers();
//    	
//    	}
//    	if(num ==2) {
//    		fileType = thesis.getNote();
//    	}
//    	
//    	filePath = rootPath + "/" + thesis.getId() + "_" + num + fileType;
//    	
//    	if("".equals(filePath)) {
//    		return ;
//    	}
//    	
//    	File file = new File(filePath);
//    	
//
//		response.setContentType(new MimetypesFileTypeMap().getContentType(file));
//		response.setHeader("Content-Disposition", "attachment;filename=" + thesis.getId() + "_" + fileType);
//    	
//    	response.getOutputStream().write(new byte());
//    }
}


