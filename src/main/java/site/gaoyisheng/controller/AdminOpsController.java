/*
 * file_name: AdminOpsController.java
 *
 * Copyright GaoYisheng Corporation 2017
 *
 * License：
 * date： 2017年11月4日 下午3:38:34
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

import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

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
import site.gaoyisheng.utils.FileUtil;

@Controller
@RequestMapping("/admin")
public class AdminOpsController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private PatentService patentService;

	@Autowired
	private EnPeriodicalThesisService enPeriodicalThesisService;
  
	@Autowired
	private ChPeriodicalThesisService chPeriodicalThesisService;
	
    @RequestMapping(value = "/upload", method = RequestMethod.GET)
    public String upload() {
        return "/admin/upload";
    }
    
    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String home() {
        return "/admin/home";
    }

    /**
     * .
     * TODO 上传文件,并解析入库  : request.getParameter("awardsType")参数 {patent,enPeriodicalThesis,chPeriodicalThesis}
     *                                                   由于还需上传 User 表,此处再加一个 {user}
     * @param file
     * @param request
     * @return
     */
    @RequestMapping(value = "/upload/{awardsType}", method = RequestMethod.POST)
    public ModelAndView importXlsFile(@RequestParam("filename") MultipartFile file, 
                                    HttpServletRequest request,
                                    @PathVariable("awardsType") String awardsType) throws Exception {
    	String strAlertMsg = null;
       if (file.isEmpty()) {
           strAlertMsg = "文件上传失败: 服务器未接收到文件";
           request.getSession().setAttribute("msg", strAlertMsg);
           return null;
        }
        
       String name = file.getOriginalFilename();// 获取上传文件名,包括路径  
       long size = file.getSize();
        
       if ((name == null || name.equals("")) && size == 0) {
           strAlertMsg = "文件上传失败: 文件内容为空";
           request.getSession().setAttribute("msg", strAlertMsg);
           return null;
        }
        
       InputStream in = file.getInputStream();
       switch(awardsType) {
             //插入并返回 提示
           case "user":strAlertMsg = "成功插入" + userService.readStreamAndInsertList(in) + "条！";break;
           case "patent":strAlertMsg = "成功插入" + patentService.readStreamAndInsertList(in) + "条！";break;
           case "enPeriodicalThesis":strAlertMsg = "成功插入" + enPeriodicalThesisService.readStreamAndInsertList(in) + "条！";break;
           case "chPeriodicalThesis":strAlertMsg = "成功插入" + chPeriodicalThesisService.readStreamAndInsertList(in) + "条！";break;
           default:strAlertMsg = "数据插入失败: 请检查log输出或开发人员";
        }
       
       request.getSession().setAttribute("msg", strAlertMsg);
       
       return new ModelAndView("redirect:/admin/upload");
    } 
	
	/**
	 * .
	 * TODO 生成Xls文件,并下载 或者下载(模版)  : request.getParameter("awardsType")参数 {patent,enPeriodicalThesis,chPeriodicalThesis,patent_model,enPeriodicalThesis_model,chPeriodicalThesis_model}
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "/download/{awardsType}", method = RequestMethod.GET)
	public void exportExcel(HttpServletRequest request, HttpServletResponse response,@PathVariable("awardsType") String awardsType) throws Exception {

		try {
//			String type = request.getParameter("awardsType");
			FileUtil fileUtil = new FileUtil();
			byte[] bytes = null;
			Path file = null;
			
			String fileNameBefore = "";
			
			switch(awardsType) {
			    case "patent": 
			    		bytes = fileUtil.exportFileOfPatent(patentService.selectAll());
			    		fileNameBefore = "专利.xls";
			    		break;
			    case "enPeriodicalThesis": 
			    		bytes = fileUtil.exportFileOfEnPeriodicalThesis(enPeriodicalThesisService.selectAll());
			    		fileNameBefore = "英文期刊论文.xls";
			    		break;
			    case "chPeriodicalThesis":
			    		bytes = fileUtil.exportFileOfChPeriodicalThesis(chPeriodicalThesisService.selectAll());
			    		fileNameBefore = "中文期刊论文.xls";
			    		break;
			    case "patent_model":
			    		fileNameBefore = "专利_模板.xls";
		    			file = Paths.get(request.getServletContext().getRealPath("/views/data"), fileNameBefore);
		    			if(Files.exists(file)) {
		    				bytes = fileUtil.getBytesFromFile(file.toFile());
		    			}
		    			break;
			    case "enPeriodicalThesis_model":
			    		fileNameBefore = "英文期刊论文_模板.xls";
		    			file = Paths.get(request.getServletContext().getRealPath("/views/data"), fileNameBefore);
		    			if(Files.exists(file)) {
		    				bytes = fileUtil.getBytesFromFile(file.toFile());
		    			}
			    		break;
			    case "chPeriodicalThesis_model":
		    			fileNameBefore = "中文期刊论文_模板.xls";
		    			file = Paths.get(request.getServletContext().getRealPath("/views/data"), fileNameBefore);
		    			if(Files.exists(file)) {
		    				bytes = fileUtil.getBytesFromFile(file.toFile());
		    			}
		    			break;
			    default : return ; //退出,并返回"无该类型文档"
			}
			
			byte[] fileNameByte = (fileNameBefore).getBytes("GBK");
			String filename = new String(fileNameByte, "ISO8859-1");

			response.setContentType("application/x-msdownload");
			response.setContentLength(bytes.length);
			response.setHeader("Content-Disposition", "attachment;filename=" + filename);
			response.getOutputStream().write(bytes);
		} catch (Exception ex) {
		}
	}
	
	/**
	 * .
	 * TODO 查看认领进度. 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/claim-statistic", method = RequestMethod.GET)
	public String toClaimStatistic(HttpServletRequest request) {
		return "/admin/claim-statistic";
	}
	
	/**
	 * .
	 * TODO 查看认领进度. (进度统计):  request.getParameter("awardsType")参数 {patent,enPeriodicalThesis,chPeriodicalThesis}
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/claim-statistic", method = RequestMethod.POST)
	@ResponseBody
	public Object claimStatistic(HttpServletRequest request) {
		String type = request.getParameter("awardsType");
		Map<String,Integer> statisticalMap = new HashMap<String,Integer>();
		
		switch(type) {
		    case "patent":statisticalMap=patentService.selectStatistic() ;break;
		    case "enPeriodicalThesis":statisticalMap=enPeriodicalThesisService.selectStatistic();break;
		    case "chPeriodicalThesis": statisticalMap=chPeriodicalThesisService.selectStatistic();break;
		}
		
		//退出,并返回"无该类型文档"
		statisticalMap.isEmpty();
		
		return statisticalMap;
	}
	
	/**
	 * .
	 * TODO  查看所有未认领的awards
	 * @param request
	 * @param mv 包含对象:{notClaimedAwardsList} :未认领awards对象的list
	 * @return
	 */
	@RequestMapping(value = "/notClaimed-list", method = RequestMethod.GET)
	public String toNotClaimedList(HttpServletRequest request,ModelAndView mv) {
		return "/admin/notClaimed-list";
	}
	
	/**
	 * .
	 * TODO  查看所有未认领的awards
	 * @param request
	 * @param mv 包含对象:{notClaimedAwardsList} :未认领awards对象的list
	 * @return
	 */
	@RequestMapping(value = "/notClaimed-list", method = RequestMethod.POST)
	@ResponseBody
	public Object notClaimedList(HttpServletRequest request) {

		String type = request.getParameter("awardsType");
		int pageNum = Integer.valueOf(request.getParameter("pageNum"));
		int pageSize = Integer.valueOf(request.getParameter("pageSize"));
		
	    PageHelper.startPage(pageNum,pageSize);
		switch(type) {
		    case "patent": return new PageInfo<Patent>(patentService.selectByStatus("未认领"));
		    case "enPeriodicalThesis": return new PageInfo<EnPeriodicalThesis>(enPeriodicalThesisService.selectByStatus("未认领"));
		    case "chPeriodicalThesis": return new PageInfo<ChPeriodicalThesis>(chPeriodicalThesisService.selectByStatus("未认领"));
		    default : return "";
		}
	}
	

	/**
	 * . 
	 * TODO 更改用户
	 * @return
	 */
	public String updateUser() {
		User user = new User();
		
		userService.updateByPrimaryKeySelective(user);
		return null;
	}


}
