/*
 * file_name: FileUtil.java
 *
 * Copyright GaoYisheng Corporation 2017
 *
 * License：
 * date： 2017年11月4日 下午7:44:02
 *       https://www.gaoyisheng.site
 *       https://github.com/timo1160139211
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package site.gaoyisheng.utils;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.expression.ParseException;

import site.gaoyisheng.pojo.ChPeriodicalThesis;
import site.gaoyisheng.pojo.EnPeriodicalThesis;
import site.gaoyisheng.pojo.Patent;
import site.gaoyisheng.pojo.Thesis;
import site.gaoyisheng.pojo.User;

public class FileUtil {
	
	/**
	 * .
	 *  文件导入: 把数据解析成list.  --Thesis
	 * @param is
	 * @return
	 * @throws IOException
	 * @throws ParseException
	 */
	public List<Thesis> importFile(InputStream is) throws IOException{  
        @SuppressWarnings("resource")
		 HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);  
        List<Thesis> thesisList = new ArrayList<Thesis>();  
        Thesis thesis; 
        
         // 循环工作表Sheet  
        for (int numSheet = 0; numSheet < hssfWorkbook.getNumberOfSheets(); numSheet++) {  
            HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(numSheet);  
            if (hssfSheet == null) {  
                continue;  
              }  
              // 循环行Row  ,从第一行开始.
            for (int rowNum = 1; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {  
            	  thesis = new Thesis();  
                HSSFRow hssfRow = hssfSheet.getRow(rowNum);  
                for (int i = 0; i < hssfRow.getLastCellNum(); i++) {  
                    HSSFCell thesisIdHSSFCell = hssfRow.getCell(i); 
                    String value = thesisIdHSSFCell.getStringCellValue();
                    if (value==null) {value="";}
                    switch(i) {
                        case 0:thesis.setType(value);break;
                        case 1:thesis.setName(value);break;
                        case 2:thesis.setNo1AutherType(value);break;
                        case 3:thesis.setNo1AutherName(value);break;
                        case 4:thesis.setCommunicateAutherName(value);break;
                        case 5:thesis.setWorkunit(value);break;
                        case 6:thesis.setOtherAutherName(value);break;
                        case 7:thesis.setPublishDate(value);break;
                        case 8:thesis.setPublishMagazineThesisSet(value);break;
                        case 9:thesis.setMagazineType(value);break;
                        case 10:thesis.setSubjectType(value);break;
                        case 11:thesis.setStairSubject(value);break;
                        case 12:thesis.setProjectSources(value);break;
                        case 13:thesis.setPublishRange(value);break;
                        case 14:thesis.setThesisSetPublisher(value);break;
                        case 15:thesis.setWordsNumbers(value);break;
                        case 16:thesis.setKeyWords(value);break;
                        case 17:thesis.setTheAbstract(value);break;
                        case 18:thesis.setNote(value);break;
                        case 19:thesis.setAppearance(value);break;
                        case 20:thesis.setCnkiLink(value);break;
                        case 21:thesis.setIssn(value);break;
                        case 22:thesis.setCn(value);break;
                        case 23:thesis.setVolumeNumberPage(value);break;
                        case 24:thesis.setDoi(value);break;
                        case 25:thesis.setConferenceName(value);break;
                        case 26:thesis.setConferenceSite(value);break;
                        case 27:thesis.setConferenceDate(value);break;
                        case 28:thesis.setEmbodyNumber(value);break;
                        case 29:thesis.setTranslationOrNot(value);break;
                        case 30:thesis.setTranslationOrNot(value);break;
                        case 31:thesis.setReferenceFrequency(value);break;
                        case 32:thesis.setSupportProject(value);break;
                       }
                    thesis.setStatus("true");
                    // null 全部置 ""
//                  for(thesis.getClass().get) {}
                }  
               
                thesisList.add(thesis);  
            }  
        }  
        return thesisList;  
    }
	
	/**
	 * .
	 *  文件导入: 把数据解析成list.  --User
	 * @param is
	 * @return
	 * @throws IOException
	 * @throws ParseException
	 */
	public List<User> importFileOfUser(InputStream is) throws IOException{  
        @SuppressWarnings("resource")
		 HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);  
        List<User> userList = new ArrayList<User>();  
        User user; 
        
         // 循环工作表Sheet  
        for (int numSheet = 0; numSheet < hssfWorkbook.getNumberOfSheets(); numSheet++) {  
            HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(numSheet);  
            if (hssfSheet == null) {  
                continue;  
              }  
            String hssfSheetName = hssfSheet.getSheetName();
            
              // 循环行Row  ,从第一行开始.
            for (int rowNum = 1; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {  
            	 user = new User();  
                HSSFRow hssfRow = hssfSheet.getRow(rowNum); 
                  //从第二列开始
                for (int i = 1; i < hssfRow.getLastCellNum(); i++) {  
                    HSSFCell thesisIdHSSFCell = hssfRow.getCell(i); 
                    String value = thesisIdHSSFCell.getStringCellValue();
                    if (value==null) {value="";}
                    switch(i) {
                           //初始化工号同时初始化密码  number==password
                        case 1:user.setNumber(value);user.setPassword(value);break;
                        case 2:user.setCollege(value);break;
                        case 3:user.setName(value);break;
                       }
                    
                   }
                  //额外设置状态为表名
                user.setStatus(hssfSheetName);
                userList.add(user);  
                }  
            
          }  
         return userList;  
    }
	
	/**
	 * .
	 *  文件导入: 把数据解析成list.   --EnPeriodicalThesis 
	 * @param InputStream
	 * @return
	 * @throws IOException
	 */
	public List<EnPeriodicalThesis> importFileOfEnPeriodicalThesis(InputStream is) throws IOException{  
        @SuppressWarnings("resource")
		 HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);  
        List<EnPeriodicalThesis> enPeriodicalThesisList = new ArrayList<EnPeriodicalThesis>();  
        EnPeriodicalThesis thesis; 
        
         // 循环工作表Sheet  
        for (int numSheet = 0; numSheet < hssfWorkbook.getNumberOfSheets(); numSheet++) {  
            HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(numSheet);  
            if (hssfSheet == null) {  
                continue;  
              }  
              // 循环行Row  ,从第1 行开始.  0 1 2 
            for (int rowNum = 1; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {  
            	  thesis = new EnPeriodicalThesis();  //有默认值 全为 ""
                HSSFRow hssfRow = hssfSheet.getRow(rowNum);  
                  //循环赋值
                for (int i = 0; i < hssfRow.getLastCellNum(); i++) {  
                    HSSFCell thesisIdHSSFCell = hssfRow.getCell(i); 
                    String value = getStringCellValue(thesisIdHSSFCell);
                    if (value==null) {value="";}
                    switch(i+1) {
                        case 1:thesis.setKeyId(value);break;
                        case 2:thesis.setName(value);break;
                        case 3:thesis.setAllAutherName(value);break;
                        case 4:thesis.setProvenance(value);break;
                        case 5:thesis.setSubject(value);break;
                        case 6:thesis.setVolume(value);break;
                        case 7:thesis.setPeriod(value);break;
                        case 8:thesis.setPage(value);break;
                        case 9:thesis.setYear(value);break;
                       }
                } 
                
                enPeriodicalThesisList.add(thesis);  
            }  
        }  
        return enPeriodicalThesisList;  
    }

	/**
	 * .
	 *  文件导入: 把数据解析成list    --ChPeriodicalThesis 
	 * @param InputStream
	 * @return
	 * @throws IOException
	 * @throws SecurityException 
	 * @throws NoSuchFieldException 
	 * @throws IllegalAccessException 
	 * @throws IllegalArgumentException 
	 */
	public List<ChPeriodicalThesis> importFileOfChPeriodicalThesis(InputStream is) throws IOException, NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException{  
        @SuppressWarnings("resource")
		 HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);  
        List<ChPeriodicalThesis> chPeriodicalThesisList = new ArrayList<ChPeriodicalThesis>();  
        ChPeriodicalThesis thesis; 
        
         // 循环工作表Sheet  
        for (int numSheet = 0; numSheet < hssfWorkbook.getNumberOfSheets(); numSheet++) {  
            HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(numSheet);  
            if (hssfSheet == null) {  
                continue;  
              }  
              // 循环行Row  ,从第1 行开始.  0 1 2 
            for (int rowNum = 1; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {  
            	  thesis = new ChPeriodicalThesis();  //有默认值 全为 ""
                HSSFRow hssfRow = hssfSheet.getRow(rowNum);  
                  //循环赋值
                for (int i = 0; i < hssfRow.getLastCellNum(); i++) {  
                    HSSFCell thesisIdHSSFCell = hssfRow.getCell(i); 
                    
                    String value = getStringCellValue(thesisIdHSSFCell);
                    if (value==null) {value="";}
                    
                    switch(i) {
                        case 0:thesis.setKeyId(value);break;
                        case 1:thesis.setProvenance(value);break;
                        case 2:thesis.setYear(value);break;
                        case 3:thesis.setMinistry(value);break;
                        case 4:thesis.setPeriod(value);break;
                        case 5:thesis.setName(value);break;
                        case 6:thesis.setKeyWords(value);break;
                        case 7:thesis.setAllAutherName(value);break;
                        case 8:thesis.setMechanism(value);break;
                       }
                }  
                
              /***********************hold不住******************************************
              String chAllAutherName = thesis.getAllAutherName();
    			String[] chNameGrp = chAllAutherName.split(";");
    			int chClassi = 1;
    			
    			@SuppressWarnings("rawtypes")
    			Class chClass = (Class) thesis.getClass();

    			for (String chStr : chNameGrp) {
    				// chStr=chStr.substring(0, s.indexOf('['));// 张三[1,2]
    				chStr = chStr.replaceAll("\\[(.+?)\\]", "");// 张三
    				chStr = chStr.replaceAll(" ", "");// 张三
    				
    				Field chFieldName = chClass.getDeclaredField("no" + chClassi + "AutherName");
    				chFieldName.setAccessible(true);
    				chFieldName.set(thesis, chStr);

    				Field chFieldNumber = chClass.getDeclaredField("no" + chClassi + "AutherNumber");
    				chFieldNumber.setAccessible(true);

    				String number = "";
    				List<User> userList = userService.searchUserFuzzyName(chStr);
    				if (userList == null || userList.isEmpty()) {// 如果档案库没有，则是说明是校外/学生
    					number = "学生?校外人员";
    				} else if (userList.size() == 1) {// 只有一个则正确
    					number = userList.get(0).getNumber();
    				} else if (userList.size() > 1) {// 否则 全部显示以供选择
    					StringBuilder sb = new StringBuilder();
    					for (int ijk = 0; ijk < userList.size(); ijk++) {
    						sb.append(userList.get(ijk).getNumber()).append("-").append(userList.get(ijk).getCollege())
    								.append("?");
    					}
    					number = sb.toString();
    				}

    				chFieldNumber.set(thesis, number);
    				chClassi++;
    			}
    			***********************************************************************/
                
                chPeriodicalThesisList.add(thesis);  
            }  
        }  
        return chPeriodicalThesisList;  
    }	

	/**
	 * .
	 *  文件导入: 把数据解析成list.   --Patent
	 * @param InputStream
	 * @return
	 * @throws IOException
	 */
	public List<Patent> importFileOfPatent(InputStream is) throws IOException{  
        @SuppressWarnings("resource")
		 HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);  
        List<Patent> patentList = new ArrayList<Patent>();  
        Patent patent; 
        
         // 循环工作表Sheet  
        for (int numSheet = 0; numSheet < hssfWorkbook.getNumberOfSheets(); numSheet++) {  
            HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(numSheet);  
            if (hssfSheet == null) {  
                continue;  
              }  
              // 循环行Row  ,从第1 行开始.  0 1 2 
            for (int rowNum = 1; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {  
            	patent = new Patent();  //有默认值 全为 ""
                HSSFRow hssfRow = hssfSheet.getRow(rowNum);  
                  //循环赋值
                for (int i = 0; i < hssfRow.getLastCellNum(); i++) {  
                    HSSFCell thesisIdHSSFCell = hssfRow.getCell(i); 
                    String value = getStringCellValue(thesisIdHSSFCell);
                    if (value==null) {value="";}
                    switch(i+1) {
                        case 1:patent.setKeyId(value);break;
                        case 2:patent.setName(value);break;
                        case 3:patent.setType(value);break;
                        case 4:patent.setAuthorizationNumber(value);break;
                        case 5:patent.setAuthorizationDate(value);break;
                        case 6:patent.setPctPatentOrNot(value);break;
                        case 7:patent.setPctPatentName(value);break;
                        case 8:patent.setPctPatentApplicationNumber(value);break;
                        case 9:patent.setPctPatentApplicationDate(value);break;
                        case 10:patent.setPctPatentPriorityDate(value);break;
                        case 11:patent.setInCountry(value);break;
                        case 12:patent.setAllAutherName(value);break;
                       }
                   }  
                patentList.add(patent);  
               }  
        }  
        return patentList;  
    }	
	
	
	/**
	 * .
	 *  导出文件: 把数据解析成byte[]  ----EnPeriodicalThesis
	 * @param list
	 * @return
	 * @throws Exception
	 */
	public byte[] exportFileOfEnPeriodicalThesis(List<EnPeriodicalThesis> list) throws Exception{

		ByteArrayOutputStream out = new ByteArrayOutputStream();
		// 第一步，创建一个web book，对应一个Excel文件
		HSSFWorkbook wb = new HSSFWorkbook();
		// 第二步，在web book中添加一个sheet,对应Excel文件中的sheet
		HSSFSheet sheet = wb.createSheet("英文期刊论文表");
		// 第三步，在sheet中添加表头第0行,注意老版本p o i对Excel的行数列数有限制short
		HSSFRow row = sheet.createRow((int) 0);
		// 第四步，创建单元格，并设置值表头 设置表头居中
		HSSFCellStyle style = wb.createCellStyle();

		// 设置表头
		List<String> excelHead = combileExcelHead();

		HSSFCell cell = null;
		// excel头
		for (int i = 0; i < excelHead.size(); i++) {
			cell = row.createCell(i);
			cell.setCellValue(excelHead.get(i));
			cell.setCellStyle(style);
		}

		// 第五步，写入实体数据 实际应用中这些数据从数据库得到
		EnPeriodicalThesis thesis = null; // 拼装excel内容
		for (int i = 0; i < list.size(); i++) {
			row = sheet.createRow((int) i + 1);
			thesis = list.get(i);
			// 创建单元格，并设置值

			int j = 0;
			insertCell(row, j++, thesis.getKeyId());
			insertCell(row, j++, thesis.getNo1AutherName());
			insertCell(row, j++, thesis.getNo1AutherNumber());
			insertCell(row, j++, thesis.getNo2AutherName());
			insertCell(row, j++, thesis.getNo2AutherNumber());
			insertCell(row, j++, thesis.getNo3AutherName());
			insertCell(row, j++, thesis.getNo3AutherNumber());
			insertCell(row, j++, thesis.getNo4AutherName());
			insertCell(row, j++, thesis.getNo4AutherNumber());
			insertCell(row, j++, thesis.getNo5AutherName());
			insertCell(row, j++, thesis.getNo5AutherNumber());
			insertCell(row, j++, thesis.getNo6AutherName());
			insertCell(row, j++, thesis.getNo6AutherNumber());
			insertCell(row, j++, thesis.getNo7AutherName());
			insertCell(row, j++, thesis.getNo7AutherNumber());
			insertCell(row, j++, thesis.getNo8AutherName());
			insertCell(row, j++, thesis.getNo8AutherNumber());
			insertCell(row, j++, thesis.getNo9AutherName());
			insertCell(row, j++, thesis.getNo9AutherNumber());
			insertCell(row, j++, thesis.getNo10AutherName());
			insertCell(row, j++, thesis.getNo10AutherNumber());
			insertCell(row, j++, thesis.getClaimStatus());
		}
		wb.write(out);wb.close();
		return out.toByteArray();
	}
	
	/**
	 * .
	 *  导出文件: 把数据解析成byte[]  ----ChPeriodicalThesis
	 * @param list
	 * @return
	 * @throws Exception
	 */
	public byte[] exportFileOfChPeriodicalThesis(List<ChPeriodicalThesis> list) throws Exception{

		ByteArrayOutputStream out = new ByteArrayOutputStream();
		// 第一步，创建一个web book，对应一个Excel文件
		HSSFWorkbook wb = new HSSFWorkbook();
		// 第二步，在web book中添加一个sheet,对应Excel文件中的sheet
		HSSFSheet sheet = wb.createSheet("中文期刊论文表");
		// 第三步，在sheet中添加表头第0行,注意老版本p o i对Excel的行数列数有限制short
		HSSFRow row = sheet.createRow((int) 0);
		// 第四步，创建单元格，并设置值表头 设置表头居中
		HSSFCellStyle style = wb.createCellStyle();

		// 设置表头
		List<String> excelHead = combileExcelHead();

		HSSFCell cell = null;
		// excel头
		for (int i = 0; i < excelHead.size(); i++) {
			cell = row.createCell(i);
			cell.setCellValue(excelHead.get(i));
			cell.setCellStyle(style);
		}

		// 第五步，写入实体数据 实际应用中这些数据从数据库得到
		ChPeriodicalThesis thesis = null; // 拼装excel内容
		for (int i = 0; i < list.size(); i++) {
			row = sheet.createRow((int) i + 1);
			thesis = list.get(i);
			// 创建单元格，并设置值

			int j = 0;
			insertCell(row, j++, thesis.getKeyId());
			insertCell(row, j++, thesis.getNo1AutherName());
			insertCell(row, j++, thesis.getNo1AutherNumber());
			insertCell(row, j++, thesis.getNo2AutherName());
			insertCell(row, j++, thesis.getNo2AutherNumber());
			insertCell(row, j++, thesis.getNo3AutherName());
			insertCell(row, j++, thesis.getNo3AutherNumber());
			insertCell(row, j++, thesis.getNo4AutherName());
			insertCell(row, j++, thesis.getNo4AutherNumber());
			insertCell(row, j++, thesis.getNo5AutherName());
			insertCell(row, j++, thesis.getNo5AutherNumber());
			insertCell(row, j++, thesis.getNo6AutherName());
			insertCell(row, j++, thesis.getNo6AutherNumber());
			insertCell(row, j++, thesis.getNo7AutherName());
			insertCell(row, j++, thesis.getNo7AutherNumber());
			insertCell(row, j++, thesis.getNo8AutherName());
			insertCell(row, j++, thesis.getNo8AutherNumber());
			insertCell(row, j++, thesis.getNo9AutherName());
			insertCell(row, j++, thesis.getNo9AutherNumber());
			insertCell(row, j++, thesis.getNo10AutherName());
			insertCell(row, j++, thesis.getNo10AutherNumber());
			insertCell(row, j++, thesis.getClaimStatus());
		}
		wb.write(out);wb.close();
		return out.toByteArray();
	}	
	
	/**
	 * .
	 *  导出文件: 把数据解析成byte[]  ----Patent
	 * @param list
	 * @return
	 * @throws Exception
	 */
	public byte[] exportFileOfPatent(List<Patent> list) throws Exception{

		ByteArrayOutputStream out = new ByteArrayOutputStream();
		// 第一步，创建一个web book，对应一个Excel文件
		HSSFWorkbook wb = new HSSFWorkbook();
		// 第二步，在web book中添加一个sheet,对应Excel文件中的sheet
		HSSFSheet sheet = wb.createSheet("中文期刊论文表");
		// 第三步，在sheet中添加表头第0行,注意老版本p o i对Excel的行数列数有限制short
		HSSFRow row = sheet.createRow((int) 0);
		// 第四步，创建单元格，并设置值表头 设置表头居中
		HSSFCellStyle style = wb.createCellStyle();

		// 设置表头
		List<String> excelHead = combileExcelHead();

		HSSFCell cell = null;
		// excel头
		for (int i = 0; i < excelHead.size(); i++) {
			cell = row.createCell(i);
			cell.setCellValue(excelHead.get(i));
			cell.setCellStyle(style);
		}

		// 第五步，写入实体数据 实际应用中这些数据从数据库得到
		Patent patent = null; // 拼装excel内容
		for (int i = 0; i < list.size(); i++) {
			row = sheet.createRow((int) i + 1);
			patent = list.get(i);
			// 创建单元格，并设置值

			int j = 0;
			insertCell(row, j++, patent.getKeyId());
			insertCell(row, j++, patent.getNo1AutherName());
			insertCell(row, j++, patent.getNo1AutherNumber());
			insertCell(row, j++, patent.getNo2AutherName());
			insertCell(row, j++, patent.getNo2AutherNumber());
			insertCell(row, j++, patent.getNo3AutherName());
			insertCell(row, j++, patent.getNo3AutherNumber());
			insertCell(row, j++, patent.getNo4AutherName());
			insertCell(row, j++, patent.getNo4AutherNumber());
			insertCell(row, j++, patent.getNo5AutherName());
			insertCell(row, j++, patent.getNo5AutherNumber());
			insertCell(row, j++, patent.getNo6AutherName());
			insertCell(row, j++, patent.getNo6AutherNumber());
			insertCell(row, j++, patent.getNo7AutherName());
			insertCell(row, j++, patent.getNo7AutherNumber());
			insertCell(row, j++, patent.getNo8AutherName());
			insertCell(row, j++, patent.getNo8AutherNumber());
			insertCell(row, j++, patent.getNo9AutherName());
			insertCell(row, j++, patent.getNo9AutherNumber());
			insertCell(row, j++, patent.getNo10AutherName());
			insertCell(row, j++, patent.getNo10AutherNumber());
			insertCell(row, j++, patent.getClaimStatus());
		}
		wb.write(out);wb.close();
		return out.toByteArray();
	}
	
	/**
	 * .
	 *  导出文件: 把数据解析成byte[]   -----Thesis
	 * @param list
	 * @return
	 * @throws Exception
	 */
	public byte[] exportFile(List<Thesis> list) throws Exception{

		ByteArrayOutputStream out = new ByteArrayOutputStream();
		// 第一步，创建一个web book，对应一个Excel文件
		HSSFWorkbook wb = new HSSFWorkbook();
		// 第二步，在web book中添加一个sheet,对应Excel文件中的sheet
		HSSFSheet sheet = wb.createSheet("论文成果表");
		// 第三步，在sheet中添加表头第0行,注意老版本p o i对Excel的行数列数有限制short
		HSSFRow row = sheet.createRow((int) 0);
		// 第四步，创建单元格，并设置值表头 设置表头居中
		HSSFCellStyle style = wb.createCellStyle();

		// 设置表头
		List<String> excelHead = getExcelHead();

		HSSFCell cell = null;
		// excel头
		for (int i = 0; i < excelHead.size(); i++) {
			cell = row.createCell(i);
			cell.setCellValue(excelHead.get(i));
			cell.setCellStyle(style);
		}

		// 第五步，写入实体数据 实际应用中这些数据从数据库得到

		Thesis thesis = null; // 拼装excel内容
		for (int i = 0; i < list.size(); i++) {
			row = sheet.createRow((int) i + 1);
			thesis = list.get(i);
			// 创建单元格，并设置值

			int j = 0;
			insertCell(row, j++, thesis.getType());
			insertCell(row, j++, thesis.getName());
			insertCell(row, j++, thesis.getNo1AutherType());
			insertCell(row, j++, thesis.getNo1AutherName());
			insertCell(row, j++, thesis.getNo1AutherNumber());
			insertCell(row, j++, thesis.getCommunicateAutherName());
			insertCell(row, j++, thesis.getWorkunit());
			insertCell(row, j++, thesis.getOtherAutherName());
			insertCell(row, j++, thesis.getPublishDate());
			insertCell(row, j++, thesis.getPublishMagazineThesisSet());
			insertCell(row, j++, thesis.getMagazineType());
			insertCell(row, j++, thesis.getSubjectType());
			insertCell(row, j++, thesis.getStairSubject());
			insertCell(row, j++, thesis.getProjectSources());
			insertCell(row, j++, thesis.getPublishRange());
			insertCell(row, j++, thesis.getThesisSetPublisher());
			insertCell(row, j++, thesis.getWordsNumbers());
			insertCell(row, j++, thesis.getSchoolSign());
			insertCell(row, j++, thesis.getKeyWords());
			insertCell(row, j++, thesis.getTheAbstract());
			insertCell(row, j++, thesis.getNote());
			insertCell(row, j++, thesis.getAppearance());
			insertCell(row, j++, thesis.getCnkiLink());
			insertCell(row, j++, thesis.getIssn());
			insertCell(row, j++, thesis.getCn());
			insertCell(row, j++, thesis.getVolumeNumberPage());
			insertCell(row, j++, thesis.getDoi());
			insertCell(row, j++, thesis.getConferenceName());
			insertCell(row, j++, thesis.getConferenceSite());
			insertCell(row, j++, thesis.getConferenceDate());
			insertCell(row, j++, thesis.getEmbodyNumber());
			insertCell(row, j++, thesis.getTranslationOrNot());
			insertCell(row, j++, thesis.getReferenceFrequency());
			insertCell(row, j++, thesis.getSupportProject());
			insertCell(row, j++, thesis.getNo2AutherName());
			insertCell(row, j++, thesis.getNo2AutherNumber());
			insertCell(row, j++, thesis.getNo3AutherName());
			insertCell(row, j++, thesis.getNo3AutherNumber());
			insertCell(row, j++, thesis.getNo4AutherName());
			insertCell(row, j++, thesis.getNo4AutherNumber());
			insertCell(row, j++, thesis.getNo5AutherName());
			insertCell(row, j++, thesis.getNo5AutherNumber());
			insertCell(row, j++, thesis.getNo6AutherName());
			insertCell(row, j++, thesis.getNo6AutherNumber());
			insertCell(row, j++, thesis.getNo7AutherName());
			insertCell(row, j++, thesis.getNo7AutherNumber());
			insertCell(row, j++, thesis.getNo8AutherName());
			insertCell(row, j++, thesis.getNo8AutherNumber());
			insertCell(row, j++, thesis.getNo9AutherName());
			insertCell(row, j++, thesis.getNo9AutherNumber());
			insertCell(row, j++, thesis.getNo10AutherName());
			insertCell(row, j++, thesis.getNo10AutherNumber());
			insertCell(row, j++, thesis.getAutherNumber());
			insertCell(row, j++, thesis.getSdutAutherNumber());
			//if(thesis.getStatus().equals("false")) {
			    insertCell(row, j++, thesis.getStatus());
			//}else {
			//	 insertCell(row, j++, "未认领");
			//}
			
		}
		wb.write(out);wb.close();
		return out.toByteArray();
	}
	
	
	/**
	 * .
	 *  获取excel表头.
	 * @return
	 */
	private List<String> getExcelHead() {
		List<String> result = new ArrayList<String>();
		result.add("论文类型");
		result.add("论文题目");
		result.add("第一作者类型");
		result.add("第一作者");
		result.add("第一作者工号");
		result.add("通讯作者");
		result.add("所属单位");
		result.add("其他作者");
		result.add("发表/出版时间");
		result.add("发表刊物/论文集");
		result.add("刊物类型");
		result.add("学科门类");
		result.add("一级学科");
		result.add("项目来源");
		result.add("发表范围");
		result.add("论文集出版单位");
		result.add("字数");
		result.add("学校署名");
		result.add("关键字");
		result.add("论文摘要");
		result.add("备注");
		result.add("版面");
		result.add("知网链接地址");
		result.add("ISSN号");
		result.add("CN号");
		result.add("卷期页");
		result.add("DOI");
		result.add("会议名称");
		result.add("会议地址");
		result.add("会议日期");
		result.add("论文收录号码");
		result.add("是否为译文");
		result.add("论文他引次数");
		result.add("依托项目");
		result.add("第二作者");
		result.add("第二作者工号");
		result.add("第三作者");
		result.add("第三作者工号");
		result.add("第四作者");
		result.add("第四作者工号");
		result.add("第五作者");
		result.add("第五作者工号");
		result.add("第六作者");
		result.add("第六作者工号");
		result.add("第七作者");
		result.add("第七作者工号");
		result.add("第八作者");
		result.add("第八作者工号");
		result.add("第九作者");
		result.add("第九作者工号");
		result.add("通讯作者工号");
		result.add("第十作者工号(废弃)");
		result.add("参与认领教职工作者数量(废弃)");
		result.add("山东理工大学教职工作者数量(废弃)");
		result.add("状态(已认领，未认领)");
		return result;
	}

	/**
	 * .
	 *  通用: 获取excel表头.
	 * @return
	 */
	private List<String> combileExcelHead() {
		List<String> excelHead = new ArrayList<String>();
		excelHead.add("论文唯一标识符");
		excelHead.add("第一作者");
		excelHead.add("第一作者工号");
		excelHead.add("第二作者");
		excelHead.add("第二作者工号");
		excelHead.add("第三作者");
		excelHead.add("第三作者工号");
		excelHead.add("第四作者");
		excelHead.add("第四作者工号");
		excelHead.add("第五作者");
		excelHead.add("第五作者工号");
		excelHead.add("第六作者");
		excelHead.add("第六作者工号");
		excelHead.add("第七作者");
		excelHead.add("第七作者工号");
		excelHead.add("通讯作者1");
		excelHead.add("通讯作者1工号");
		excelHead.add("通讯作者2");
		excelHead.add("通讯作者2工号");
		excelHead.add("归属学院");//excelHead.add("第十作者");替换
		excelHead.add("审核状态");
		excelHead.add("状态(已认领，未认领)");
		return excelHead;
	}

	/**
	 * .
	 *  插入一行数据.
	 * @param row
	 * @param i
	 * @param object
	 */
	private void insertCell(HSSFRow row, int i, Object object) {

		if (object == null) {
			row.createCell(i).setCellValue("");
		} else {
			row.createCell(i).setCellValue(object.toString());
		}

	}
	
	/**
	 * .
	 * 获取单元格数据内容为字符串类型的数据
	 * 
	 * @param cell Excel单元格
	 * @returnString 单元格数据内容
	 */
    private String getStringCellValue(HSSFCell cell) {
        String cellValue = "";  

        if(cell != null) {//不为空，避免NPE
          if(cell.getCellType()==cell.CELL_TYPE_STRING) {cellValue = cell.getRichStringCellValue().getString(); }
          if(cell.getCellType()==cell.CELL_TYPE_NUMERIC) {
        	  cell.setCellType(cell.CELL_TYPE_STRING);  
        	  cellValue = String.valueOf(cell.getRichStringCellValue().getString());
           }
         }
        
        return cellValue;
    }
    
    /**
     * .
     *  文件转化为字节数组
     * @param f
     * @return
     */
    public byte[] getBytesFromFile(File f) {
        if (f == null) {
            return null;
        }
        try {
            FileInputStream stream = new FileInputStream(f);
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] b = new byte[1000];
            int n;
            while ((n = stream.read(b)) != -1)
                out.write(b, 0, n);
            stream.close();
            out.close();
            return out.toByteArray();
        } catch (IOException e) {
        }
        return null;
    }
    
}
