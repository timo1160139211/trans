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
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import site.gaoyisheng.pojo.Thesis;
import site.gaoyisheng.service.ThesisService;
import site.gaoyisheng.service.UserService;
import site.gaoyisheng.utils.FileUtil;

@Controller
@RequestMapping("/admin")
public class AdminOpsController {

	@Autowired
	private UserService userService;

	@Autowired
	private ThesisService thesisService;

	/**
	 * . 
	 * TODO 上传文件,并解析入库
	 * @return
	 */
    @RequestMapping(value = "/upload", method = RequestMethod.POST)  
    public ModelAndView importBrandSort(@RequestParam("filename") MultipartFile file,HttpServletRequest request,HttpServletResponse response) throws Exception {  
        if (file == null) { 
            String strAlertMsg= "文件上传失败: 服务器未接收到文件";  
            request.getSession().setAttribute("msg",strAlertMsg);
            return null;  
         }
  
        String name = file.getOriginalFilename();// 获取上传文件名,包括路径  
        long size = file.getSize();  
        if ((name == null || name.equals("")) && size == 0)  {
            String strAlertMsg= "文件上传失败: 文件内容为空"; 
            request.getSession().setAttribute("msg",strAlertMsg);
            return null;  
         }
        InputStream in = file.getInputStream();  
        int count = thesisService.readStreamAndInsertList(in);  
  
        String strAlertMsg= "成功插入" + count + "条！";  
          
        request.getSession().setAttribute("msg",strAlertMsg);  
//        return get(request, response);  
        return null;  
    }  
	

	/**
	 * 
	 * .
	 * TODO 查库,声称文件,并下载
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public void exportBrandSort(HttpServletRequest request, HttpServletResponse response) throws Exception {

		try {
			List<Thesis> list = thesisService.selectAllThesis();

			byte[] fileNameByte = ("下载.xls").getBytes("GBK");
			String filename = new String(fileNameByte, "ISO8859-1");

			FileUtil fileUtil = new FileUtil();
			byte[] bytes = fileUtil.exportFile(list);

			response.setContentType("application/x-msdownload");
			response.setContentLength(bytes.length);
			response.setHeader("Content-Disposition", "attachment;filename=" + filename);
			response.getOutputStream().write(bytes);

		} catch (Exception ex) {
		}
	}

	/**
	 * . 
	 * TODO 查用户
	 * @return
	 */
	public String userList() {

		return null;
	}

	/**
	 * . 
	 * TODO 更改用户
	 * @return
	 */
	public String updateUser() {

		return null;
	}


}
