/*
 * file_name: OpusAwardService.java
 *
 * Copyright GaoYisheng Corporation 2017
 *
 * License：
 * date： 2017年11月15日 下午9:36:21
 *       https://www.gaoyisheng.site
 *       https://github.com/timo1160139211
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package site.gaoyisheng.service;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.gaoyisheng.dao.OpusAwardMapper;
import site.gaoyisheng.pojo.OpusAward;
import site.gaoyisheng.utils.FileUtil;

@Service
public class OpusAwardService {

	@Autowired
	private OpusAwardMapper opusDao;

	/**
	 * .
	 * TODO 查询所有
	 * @return
	 */
	public List<OpusAward> selectAll() {
		return opusDao.selectAll();
	}

	/**
	 * .
	 * TODO 通过认领状态查询
	 * @param status
	 * @return
	 */
	public List<OpusAward> selectByStatus(String status) {
		return opusDao.selectByStatus(status);
	}

	/**
	 * .
	 * TODO  通过认领状态查询,+分页参数:重载
	 * @param status
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	public List<OpusAward> selectByStatus(String claimStatus,int pageNum,int pageSize) {
		return opusDao.selectByStatus(claimStatus,pageNum,pageSize);
	}
	
	/**
	 * . 
	 * TODO 统计: "已认领"="claimed"  ,"notClaimed"="未认领"  ,总数="total"
	 * 
	 * @return
	 */
	public Map<String, Integer> selectStatistic() {
		Map<String, Integer> map = new HashMap<String, Integer>();

		map.put("claimed", opusDao.selectCountByStatus("已认领"));
		map.put("notClaimed", opusDao.selectCountByStatus("未认领"));
		map.put("total", opusDao.selectCount());

		return map;
	}

	/**
	 * .
	 * TODO 主键查询
	 * @param id
	 * @return
	 */
	public OpusAward selectByPrimaryKey(Integer id) {
		return opusDao.selectByPrimaryKey(id);
	}
	
	/**
	 * 
	 * .
	 * TODO 唯一
	 * @param id
	 * @return
	 */
	public OpusAward selectByUniqueKey(Integer id) {
		return opusDao.selectByPrimaryKey(id);
	}

	/**
	 * 
	 * .
	 * TODO 多条件查询
	 * @param map
	 * @return
	 */
	public List<OpusAward> selectByMultiConditions(Map<String, String> map) {
		return opusDao.selectByMultiConditions(map);
	}
	/*
	 * 		this.no10AutherNumber = "未审核";
		this.claimStatus = "未认领";
		
		
	 * 			<if test="opusName != '' and opusName != null">
				opus_name like concat('%','${opusName}','%')
			</if>
			<if test="autherName != '' and autherName != null">
				AND other_auther_name like concat('%','${autherName}','%')
			</if>
			<if test="claimStatus != '' and claimStatus != null">
				AND claim_status = #{claimStatus}
			</if>
			<if test="no10AutherNumber != '' and no10AutherNumber != null">
				AND no10_auther_number = #{no10AutherNumber}
			</if>
	 * 
	 */
	
	/**
	 * .
	 * TODO 多条件查询 +分页参数:重载
	 * @param map
	 * @return
	 */
	public List<OpusAward> selectByMultiConditions(Map<String, String> map,int pageNum,int pageSize) {
		return opusDao.selectByMultiConditions(map,pageNum,pageSize);
	}

	/**
	 * .
	 * TODO 通过主键更新.(值为  null , '' 的字段将不被更新)
	 * @param p
	 * @return
	 */
	public int updateByPrimaryKeySelective(OpusAward p) {
		return opusDao.updateByPrimaryKeySelective(p);
	}
	
	/**
	 * .
	 * TODO 将数据流读取并批量插入
	 * @param in
	 * @return
	 * @throws Exception
	 */
	public int readStreamAndInsertList(InputStream in) throws Exception {
		FileUtil fileUtil = new FileUtil();
		List<OpusAward> opusAwardList = fileUtil.importFileOfOpusAward(in);
		
		//每1000为一段 插入
		return recurSub(opusAwardList,500);
	}

	/**
	 * .
	 * TODO 批量插入
	 * @param opusAwardList
	 * @return
	 * @throws Exception
	 */
	public int insertList(List<OpusAward> opusAwardList) throws Exception {
		return opusDao.insertList(opusAwardList);
	}
	
	
	public int deleteByPrimaryKey(int id) {
		return opusDao.deleteByPrimaryKey(id);
	}
	
	public int insertSelective(OpusAward opusAward) {
		return opusDao.insertSelective(opusAward);
	}
	/**
	 * .
	 * TODO 递归:分割长List为 subNum/段。
	 * @param thesisList 论文list(总)
	 * @param subNum 每段长度 (最小1)
	 * @return
	 * @throws Exception
	 */
	private int recurSub(List<OpusAward> thesisList,int subNum) throws Exception{
		//参数合法性判断:
		if(thesisList.isEmpty()) return 0;
		if(subNum<1) return 0;
				
		//大于subNum，进入分割
		if(thesisList.size() > subNum) {// && !(thesisList.isEmpty())
			//将前subNum分出来，直接插入到数据库。
			List<OpusAward> toInsert = thesisList.subList(0, subNum);
			//将subNum至最后 (剩余部分) 继续进行递归分割
			List<OpusAward> toRecurSub = thesisList.subList(subNum, thesisList.size());
			
			//将前subNum分出来，直接插入到数据库 && 将subNum+1至最后 (剩余部分) 继续进行递归分割 。统计数量
			return insertList(toInsert) + recurSub(toRecurSub,subNum);
			
		//少于subNum，直接插入数据库 (递归出口)
		}else {
			//插入到数据库。统计数量
		    return insertList(thesisList);
		}
	}
}
