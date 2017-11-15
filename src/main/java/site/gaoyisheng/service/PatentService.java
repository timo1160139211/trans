/*
 * file_name: PatentService.java
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

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.gaoyisheng.dao.PatentMapper;
import site.gaoyisheng.pojo.Patent;

@Service
public class PatentService {

	@Autowired
	private PatentMapper thesisDao;

	public List<Patent> selectAll() {
		return thesisDao.selectAll();
	}

	public List<Patent> selectByStatus(String status) {
		return thesisDao.selectByStatus(status);
	}

	/**
	 * . 
	 * TODO 统计: "已认领"="claimed"  ,"notClaimed"="未认领"  ,总数="total"
	 * 
	 * @return
	 */
	public Map<String, Integer> selectStatistic() {
		Map<String, Integer> map = new HashMap<String, Integer>();

		map.put("claimed", thesisDao.selectCountByStatus("已认领"));
		map.put("notClaimed", thesisDao.selectCountByStatus("未认领"));
		map.put("total", thesisDao.selectCount());

		return map;
	}

	public Patent selectByPrimaryKey(Integer thesisId) {
		return thesisDao.selectByPrimaryKey(thesisId);
	}

	public List<Patent> selectByMultiConditions(Map<String, String> map) {
		return thesisDao.selectByMultiConditions(map);
	}

//	public int readStreamAndInsertList(InputStream in) throws Exception {
//		FileUtil fileUtil = new FileUtil();
//		List<Patent> thesisList = fileUtil.importFileOfPatent(in);
//		return thesisDao.insertList(thesisList);
//	}

	public int insertList(List<Patent> thesisList) throws Exception {
		return thesisDao.insertList(thesisList);
	}
}
