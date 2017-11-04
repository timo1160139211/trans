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
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import site.gaoyisheng.pojo.Thesis;

public class FileUtil {

	/**
	 * 
	 * .
	 * TODO
	 * @param is
	 * @return
	 * @throws IOException
	 * @throws ParseException
	 */
//	private List<BrandMobileInfoEntity> readBrandPeriodSorXls(InputStream is)  
//            throws IOException, ParseException {  
//        HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);  
//        List<BrandMobileInfoEntity> brandMobileInfos = new ArrayList<BrandMobileInfoEntity>();  
//        BrandMobileInfoEntity brandMobileInfo;  
//        // 循环工作表Sheet  
//        for (int numSheet = 0; numSheet < hssfWorkbook.getNumberOfSheets(); numSheet++) {  
//            HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(numSheet);  
//            if (hssfSheet == null) {  
//                continue;  
//            }  
//            // 循环行Row  
//            for (int rowNum = 1; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {  
//                brandMobileInfo = new BrandMobileInfoEntity();  
//                HSSFRow hssfRow = hssfSheet.getRow(rowNum);  
//                for (int i = 0; i < hssfRow.getLastCellNum(); i++) {  
//                    HSSFCell brandIdHSSFCell = hssfRow.getCell(i);  
//                    if (i == 0) {  
//                        brandMobileInfo.setBrandId(Integer  
//                                .parseInt(getCellValue(brandIdHSSFCell)));  
//                    } else if (i == 1) {  
//                        continue;  
//                    } else if (i == 2) {  
//                        brandMobileInfo.setMobileShowFrom(Integer.parseInt(getCellValue(brandIdHSSFCell)));  
//                    } else if (i == 3) {  
//                        brandMobileInfo.setMobileShowTo(Integer.parseInt(getCellValue(brandIdHSSFCell)));  
//                    } else if (i == 4) {  
//                        brandMobileInfo.setSellMarkValue(getCellValue(brandIdHSSFCell));  
//                    } else if (i == 5) {  
//                        brandMobileInfo.setWarehouse(getCellValue(brandIdHSSFCell));  
//                    } else if (i == 6) {  
//                        brandMobileInfo.setSortA1(Integer.parseInt(getCellValue(brandIdHSSFCell)));  
//                    } else if (i == 7) {  
//                        brandMobileInfo.setSortA2(Integer.parseInt(getCellValue(brandIdHSSFCell)));  
//                    } else if (i == 8) {  
//                        brandMobileInfo.setSortB(Integer.parseInt(getCellValue(brandIdHSSFCell)));  
//                    } else if (i == 9) {  
//                        brandMobileInfo.setSortC10(Integer.parseInt(getCellValue(brandIdHSSFCell)));  
//                    } else if (i == 10) {  
//                        brandMobileInfo.setSortC(Integer.parseInt(getCellValue(brandIdHSSFCell)));  
//                    } else if (i == 11) {  
//                        brandMobileInfo.setHitA(getCellValue(brandIdHSSFCell));  
//                    } else if (i == 12) {  
//                        brandMobileInfo.setHitB(getCellValue(brandIdHSSFCell));  
//                    } else if (i == 13) {  
//                        brandMobileInfo.setHitC(getCellValue(brandIdHSSFCell));  
//                    } else if (i == 14) {  
//                        brandMobileInfo.setCustomSellType(getCellValue(brandIdHSSFCell));  
//                    }else if (i == 15) {  
//                      continue;  
//                    }else if (i == 16) {  
//                        brandMobileInfo.setChannelId(Integer.parseInt(getCellValue(brandIdHSSFCell)));  
//                    }  
//                }  
//                brandMobileInfos.add(brandMobileInfo);  
//  
//            }  
//        }  
//        return brandMobileInfos;  
//    }
	
	/**
	 * .
	 * TODO 导出文件.
	 * @param list
	 * @return
	 * @throws Exception
	 */
	public byte[] exportFile(List<Thesis> list) throws Exception{

		ByteArrayOutputStream out = new ByteArrayOutputStream();
		// 第一步，创建一个webbook，对应一个Excel文件
		HSSFWorkbook wb = new HSSFWorkbook();
		// 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
		HSSFSheet sheet = wb.createSheet("论文成果表");
		// 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short
		HSSFRow row = sheet.createRow((int) 0);
		// 第四步，创建单元格，并设置值表头 设置表头居中
		HSSFCellStyle style = wb.createCellStyle();
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式

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
			if(thesis.getStatus().equals("false")) {
			    insertCell(row, j++, "已认领");
			}else {
				 insertCell(row, j++, "未认领");
			}
			
		}
		wb.write(out);
		return out.toByteArray();
	}

	/**
	 * .
	 * TODO 获取excel表头.
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
		result.add("第十作者");
		result.add("第十作者工号");
		result.add("参与认领教职工作者数量");
		result.add("山东理工大学教职工作者数量");
		result.add("状态(已认领，未认领)");
		return result;
	}

	/**
	 * .
	 * TODO 插入一行数据.
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
}
