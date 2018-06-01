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

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import site.gaoyisheng.pojo.AchievementAward;
import site.gaoyisheng.pojo.ChPeriodicalThesis;
import site.gaoyisheng.pojo.EnPeriodicalThesis;
import site.gaoyisheng.pojo.Patent;
import site.gaoyisheng.pojo.Thesis;
import site.gaoyisheng.pojo.User;
import site.gaoyisheng.service.AchievementAwardService;
import site.gaoyisheng.service.ChPeriodicalThesisService;
import site.gaoyisheng.service.EnPeriodicalThesisService;
import site.gaoyisheng.service.PatentService;
import site.gaoyisheng.service.ThesisService;
import site.gaoyisheng.service.UserService;

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
	
	@Autowired
	private AchievementAwardService achievementAwardService;
	
//	@Autowired
//	private OpusAwardService opusAwardService;
	
    /**
     * 返回论文列表. 
     * 参数: 用户姓名. 
     * 返回: 论文列表模型.
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
     *  返回 成果 详细.  
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
           case "achievementAward": return achievementAwardService.selectByPrimaryKey(id);
//           case "opusAward": return opusAwardService.selectByPrimaryKey(id);
           default : return "{\"msg\":\"数据错误,再试一次\"}";
        }
    }
        
    /** 
     * .
     *  返回 成果 列表.  request.getParameter("awardsType")参数 {patent,enPeriodicalThesis,chPeriodicalThesis,opusAward,achievementAward}
     * @param request
     * @return
     */
    @RequestMapping(value = "/awards-list" ,method = RequestMethod.POST)
    @ResponseBody
    public Object awardsList(HttpServletRequest request) {
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
    	 map.put("claimStatus", request.getParameter("claimStatus"));
    	 map.put("no10AutherNumber", request.getParameter("no10AutherNumber"));
    	 map.put("no10AutherName", request.getParameter("no10AutherName"));
        
    	 //分页参数
    	 int pageNum = Integer.valueOf(request.getParameter("pageNum"));
    	 int pageSize = 30;
    	 
    	 switch(request.getParameter("awardsType")) {
            case "patent": PageHelper.startPage(pageNum,pageSize);return new PageInfo<Patent>(patentService.selectByMultiConditions(map));
            case "chPeriodicalThesis": PageHelper.startPage(pageNum,pageSize);return new PageInfo<ChPeriodicalThesis>(chPeriodicalThesisService.selectByMultiConditions(map));
            case "enPeriodicalThesis": PageHelper.startPage(pageNum,pageSize);return new PageInfo<EnPeriodicalThesis>(enPeriodicalThesisService.selectByMultiConditions(map));
            case "achievementAward": PageHelper.startPage(pageNum,pageSize);return new PageInfo<AchievementAward>(achievementAwardService.selectByMultiConditions(map));
//          case "opusAward": PageHelper.startPage(pageNum,pageSize);return new PageInfo<OpusAward>(opusAwardService.selectByMultiConditions(map));
            default : return null;
         }
    }
	
    /**
     * 认领. 参数:
     *
     * 返回:
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
     *  认领      ("awardsType")参数 {patent,enPeriodicalThesis,chPeriodicalThesis,achievementAward}
     * @param request
     * @return
     * @throws IOException 
     * @throws UnsupportedEncodingException
     */
    @RequestMapping(value = "/claim", method = RequestMethod.POST)
    public void claim( ModelAndView mv,
    		HttpServletRequest request,
    		HttpServletResponse response,
    		@ModelAttribute Patent patent,
    		@ModelAttribute EnPeriodicalThesis enPeriodicalThesis,
    		@ModelAttribute ChPeriodicalThesis chPeriodicalThesis,
    		@ModelAttribute AchievementAward achievementAward,
//    		@ModelAttribute OpusAward opusAward,
    		@RequestParam String awardsType) throws IOException  {
        
    	StringBuilder msg=new StringBuilder();
        switch(awardsType) {
            case "patent": patent.setClaimStatus("已认领");patent.setNo10AutherNumber("未审核");
            	if(patentService.updateByPrimaryKeySelective(patent)==1) {
            		msg.append("成功:认领[").append(patent.getName()).append("]");
            	}else {
            		msg.append("失败:认领[").append(patent.getName()).append("]失败");
            	}
            	break;
            case "enPeriodicalThesis":  
            	enPeriodicalThesis.setClaimStatus("已认领");enPeriodicalThesis.setNo10AutherNumber("未审核");
            	if(enPeriodicalThesisService.updateByPrimaryKeySelective(enPeriodicalThesis)==1) {
            		msg.append("成功:认领[").append(enPeriodicalThesis.getName()).append("]");
            	}else {
            		msg.append("失败:认领[").append(enPeriodicalThesis.getName()).append("]失败");
            	}
            	break;
            case "chPeriodicalThesis":  
            	chPeriodicalThesis.setClaimStatus("已认领");chPeriodicalThesis.setNo10AutherNumber("未审核");
            	if(chPeriodicalThesisService.updateByPrimaryKeySelective(chPeriodicalThesis)==1) {
            		msg.append("成功:认领[").append(chPeriodicalThesis.getName()).append("]");
            	}else {
            		msg.append("失败:认领[").append(chPeriodicalThesis.getName()).append("]失败");
            	}
            case "achievementAward":  
            	achievementAward.setClaimStatus("已认领");achievementAward.setNo10AutherNumber("未审核");
            	if(achievementAwardService.updateByPrimaryKeySelective(achievementAward)==1) {
            		msg.append("成功:认领[").append(achievementAward.getAchievementName()).append("]");
            	}else {
            		msg.append("失败:认领[").append(achievementAward.getAchievementName()).append("]失败");
            	}
//            case "opusAward":  
//            	opusAward.setClaimStatus("已认领");opusAward.setNo10AutherNumber("未审核");
//            	if(opusAwardService.updateByPrimaryKeySelective(opusAward)==1) {
//            		msg.append("成功:认领[").append(opusAward.getAchievementName()).append("]");
//            	}else {
//            		msg.append("失败:认领[").append(opusAward.getAchievementName()).append("]失败");
//            	}
            default : break;
         }
        
        response.sendRedirect("awards-list");
    }
    
    /**
     * .
     *  返回查找的用户数据
     * @param request
     * @return
     * @throws IOException 
     */
    @RequestMapping(value = "/sereachUser",method = RequestMethod.GET,produces = "application/json; charset=utf-8")//解决中文??问题
    @ResponseBody
    public Object userInfo(HttpServletRequest request,HttpServletResponse response) throws IOException {
    	
    	String number = "";
    	request.setCharacterEncoding("utf-8");
    	String srcChar = "ISO8859-1";  
    	String dstChar = "UTF-8";  
    	List<User> userList = userService.searchUserFuzzyName(new String(request.getParameter("inputName").getBytes(srcChar),dstChar));
		
		if (userList.isEmpty()) {// 如果档案库没有，则是说明是校外/学生
			number = "学生?校外人员";
		} else if (userList.size() == 1) {// 只有一个则正确
			number = userList.get(0).getNumber();
		} else if (userList.size() > 1 && userList.size() < 6) {// 显示以供选择  <6防止过长
			StringBuilder sb = new StringBuilder();
			for (int ijk = 0; ijk < userList.size(); ijk++) {
				sb.append(userList.get(ijk).getNumber()).append("-").append(userList.get(ijk).getCollege())
						.append("?");
			}
			number = sb.toString();
		}else {  //太多了没法显示
			number = "重名太多,请自查";
		}
		
    	return "{\"number\":\""+number+"\"}";
    }
    
    /**
     * 根据表单后面的认领按钮提交对应的id返回相应的表单填写页面
     * @param request
     * @return 
     * @throws SecurityException 
     * @throws NoSuchFieldException 
     * @throws IllegalAccessException 
     * @throws IllegalArgumentException 
     */
    @RequestMapping(value = "/options-contant", method = RequestMethod.POST)
	public ModelAndView optionsContant(HttpServletRequest request)
			throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException {
		ModelAndView mv = new ModelAndView();

		int autherNum = 0;//作者数量
		switch (request.getParameter("awardsType")) {
		case "patent":
			Patent pa = patentService.selectByPrimaryKey(Integer.valueOf(request.getParameter("id")));// 查

			String paAllAutherName = pa.getAllAutherName();
			String[] paNameGrp = paAllAutherName.split(";");
			int paClassi = 1;

			autherNum = paNameGrp.length;
			
			@SuppressWarnings("rawtypes")
			Class paClass = (Class) pa.getClass();

			for (String paStr : paNameGrp) {
				if(paClassi<8) {//只处理前7个
				
				// paStr=paStr.substring(0, s.indexOf('['));// 张三[1,2]
				paStr = paStr.replaceAll("\\[(.+?)\\]", "");// 张三
				paStr = paStr.replaceAll(" ", "");// 张三

				Field paFieldName = paClass.getDeclaredField("no" + paClassi + "AutherName");
				paFieldName.setAccessible(true);
				paFieldName.set(pa, paStr);

				Field paFieldNumber = paClass.getDeclaredField("no" + paClassi + "AutherNumber");
				paFieldNumber.setAccessible(true);

				String number = "";
				List<User> userList = userService.searchUserFuzzyName(paStr);
				if (userList.isEmpty()) {// 如果档案库没有，则是说明是校外/学生
					number = "学生?校外人员";
				} else if (userList.size() == 1) {// 只有一个则正确
					number = userList.get(0).getNumber();
				} else if (userList.size() > 1) {// 否则 全部显示以供选择
					StringBuilder sb = new StringBuilder();
					for (int ijk = 0; ijk < userList.size() && ijk < 10; ijk++) {
						sb.append(userList.get(ijk).getNumber()).append("-").append(userList.get(ijk).getCollege())
								.append("?");
					}
					number = sb.toString();
				}

				paFieldNumber.set(pa, number);
				paClassi++;
				}//if <8
			}
			mv.addObject("awards", pa);
			mv.addObject("awardsType", "patent");
			mv.addObject("autherNum", autherNum);

			break;
		case "enPeriodicalThesis":
			EnPeriodicalThesis en = enPeriodicalThesisService
					.selectByPrimaryKey(Integer.valueOf(request.getParameter("id")));
			
			String enAllAutherName = en.getAllAutherName();
			String[] enNameGrp = enAllAutherName.split(";");
			autherNum = enNameGrp.length;
			
			mv.addObject("awards",en);
			mv.addObject("awardsType", "enPeriodicalThesis");
			mv.addObject("autherNum", autherNum);
			break;
		case "chPeriodicalThesis":
			ChPeriodicalThesis ch = chPeriodicalThesisService
					.selectByPrimaryKey(Integer.valueOf(request.getParameter("id")));
			String chAllAutherName = ch.getAllAutherName();
			String[] chNameGrp = chAllAutherName.split(";");
			int chClassi = 1;
			
			autherNum = chNameGrp.length;//作者数量
			
			@SuppressWarnings("rawtypes")
			Class chClass = (Class) ch.getClass();

			for (String chStr : chNameGrp) {
				if(chClassi<8) {//只处理前7个
				chStr = chStr.replaceAll("\\[(.+?)\\]", "");// 张三
				chStr = chStr.replaceAll(" ", "");// 张三
				
				Field chFieldName = chClass.getDeclaredField("no" + chClassi + "AutherName");
				chFieldName.setAccessible(true);
				chFieldName.set(ch, chStr);

				Field chFieldNumber = chClass.getDeclaredField("no" + chClassi + "AutherNumber");
				chFieldNumber.setAccessible(true);

				String number = "";
				List<User> userList = userService.searchUserFuzzyName(chStr);
				if (userList.isEmpty()) {// 如果档案库没有，则是说明是校外/学生
					number = "学生?校外人员";
				} else if (userList.size() == 1) {// 只有一个则正确
					number = userList.get(0).getNumber();
				} else if (userList.size() > 1) {// 否则 全部显示以供选择
					StringBuilder sb = new StringBuilder();
					for (int ijk = 0; ijk < userList.size() && ijk < 10; ijk++) {
						sb.append(userList.get(ijk).getNumber()).append("-").append(userList.get(ijk).getCollege())
								.append("?");
					}
					number = sb.toString();
				}

				chFieldNumber.set(ch, number);
				chClassi++;
				}//if <8
			}
			mv.addObject("awards", ch);
			mv.addObject("awardsType", "chPeriodicalThesis");
			mv.addObject("autherNum", autherNum);
			
			break;
			
		case "achievementAward":
			AchievementAward aa = achievementAwardService
					.selectByPrimaryKey(Integer.valueOf(request.getParameter("id")));
			
			autherNum = 8;
			
			mv.addObject("awards",aa);
			mv.addObject("awardsType", "achievementAward");
			mv.addObject("autherNum", autherNum);
			break;
//		case "opusAward":
//			OpusAward opusAward = opusAwardService
//					.selectByPrimaryKey(Integer.valueOf(request.getParameter("id")));
//			
//			autherNum = 8;
//			
//			mv.addObject("awards",opusAward);
//			mv.addObject("awardsType", "opusAward");
//			mv.addObject("autherNum", autherNum);
//			break;
		default:
			break;
		}

		mv.setViewName("user/options-contant");
		return mv;
	}
	
    /**
     * .
     * 填写修改个人信息表单. 
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
     * 提交表单,更新数据库,更改session用户. 
     *
     * @param userForm
     * @param request
     * @return
     */
    @RequestMapping(value = "/user-update", method = RequestMethod.POST)
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
     * 模糊查找一个用户.
     * @return
     */
    @RequestMapping(value = "/search/{pageNum}", method = RequestMethod.POST)
    @ResponseBody
    public Object fuzzySearchUser(@RequestParam("name")String name,@PathVariable("pageNum")int pageNum){
    	User u = new User();
    	//非空判断 => 设值 用于查询.
    	u.setName(name);
    	
    	PageHelper.startPage(pageNum,30);
    	return new PageInfo<User>(userService.searchUserFuzzyQuery(u));
    } 
    
    @RequestMapping(value = "/awards-create", method = RequestMethod.GET)		
    public String toAwardsCreate() {	
    	return "user/awards-create";		
    }
    
    /**
     * 
     * .
     *  API约定:
     *   ~/tomcat/webapps_data/    => rootPath
     *   
     *  rootPath + "/" + thesis.getId() + "_1" + file1Type;  = 图片文件1 的名字
     *  
     *      thesis.setWordsNumbers(file1Type);
     *      thesis.setNote(file2Type);
     *      
     * @param request
     * @param thesis
     * @param mav
     * @param pictureFile1
     * @param pictureFile2
     * @return
     * @throws IOException
     */
    @RequestMapping(consumes = "multipart/form-data",value = "/awards-create", method = RequestMethod.POST)
    public ModelAndView awardsCreate(HttpServletRequest request,Thesis thesis,ModelAndView mav,
    		@RequestParam("pictureFile1") MultipartFile pictureFile1, 
    		@RequestParam("pictureFile2") MultipartFile pictureFile2) throws IOException {		
    	
    	String rootPath = System.getProperty("catalina.home") + "/webapps_data";
    	
    	if(!(new File(rootPath).exists())) {
    		//   ~/tomcat/webapps_data/    如果目录不存在，则创建之
    		new File(rootPath).mkdir();
    	}
    	
    	String file1Type = pictureFile1.getOriginalFilename().substring(
    			pictureFile1.getOriginalFilename().lastIndexOf("."));
    	
    	String file2Type = pictureFile2.getOriginalFilename().substring(
    			pictureFile2.getOriginalFilename().lastIndexOf("."));
    	
    	thesis.setWordsNumbers(file1Type);
    	thesis.setNote(file2Type);
    	int numFlag = thesisService.createSelective(thesis);//----------------------
    	
    	String file1Path = rootPath + "/" + thesis.getId() + "_1" + file1Type;
    	String file2Path = rootPath + "/" + thesis.getId() + "_2" + file2Type;
    	
		pictureFile1.transferTo(new File(file1Path));
    	pictureFile2.transferTo(new File(file2Path));
    	
    	mav.setViewName("/user/awards-create");
    	
    	//自行处理事务: 如果文件上传成功了
		if (numFlag == 1 && new File(file1Path).exists() && new File(file2Path).exists()) {
			return mav.addObject("msg", "成功追加论文:" + thesis.getName());
		} else {
			thesisService.deleteByPrimaryKey(thesis.getId());
			return mav.addObject("msg", "追加失败论文:" + thesis.getName());
		}
    }
    
    @PostMapping(value = "/thesis-detail")
 	public ModelAndView thesisDetail(HttpServletRequest request,ModelAndView mav){
 		mav.addObject("thesis", thesisService.selectByPrimaryKey(Integer.valueOf(request.getParameter("id"))));
 		mav.setViewName("user/thesis-detail");
 		return mav;
 	}
    
    /**
     * .
     * @return
     */
    @GetMapping(value = "thesis-additional-list")
    public String toThesisAdditionalList() {
    	return "user/thesis-additional-list";
    }
    
    /**
     * .
     * @param request
     * @return
     */
    @PostMapping(value = "thesis-additional-list")
    @ResponseBody
    public Object thesisAdditionalList(HttpServletRequest request) {
		Map<String,String> map = new HashMap<String,String>();
		
		map.put("name", request.getParameter("name"));
		map.put("workunit", request.getParameter("workunit"));
		map.put("status", request.getParameter("status"));
		
		map.put("searchName", request.getParameter("searchName"));
		
		//分页参数
		int pageNum = Integer.valueOf(request.getParameter("pageNum"));
		int pageSize = 30;
		
		PageHelper.startPage(pageNum,pageSize);
		return new PageInfo<Thesis>(thesisService.selectByMultiConditions(map));
    }
    
}
