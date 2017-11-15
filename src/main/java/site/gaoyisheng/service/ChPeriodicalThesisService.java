/*
 * file_name: ChPeriodicalThesisService.java
 *
 * Copyright GaoYisheng Corporation 2017
 *
 * License：
 * date： 2017年11月15日 下午9:32:52
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

import site.gaoyisheng.dao.ChPeriodicalThesisMapper;
import site.gaoyisheng.pojo.ChPeriodicalThesis;
import site.gaoyisheng.utils.FileUtil;

@Service
public class ChPeriodicalThesisService {

	@Autowired
	private ChPeriodicalThesisMapper thesisDao;

	public List<ChPeriodicalThesis> selectAll() {
		return thesisDao.selectAll();
	}

	public List<ChPeriodicalThesis> selectByStatus(String status) {
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

	public ChPeriodicalThesis selectByPrimaryKey(Integer thesisId) {
		return thesisDao.selectByPrimaryKey(thesisId);
	}

	public List<ChPeriodicalThesis> selectByMultiConditions(Map<String, String> map) {
		return thesisDao.selectByMultiConditions(map);
	}

//	public int readStreamAndInsertList(InputStream in) throws Exception {
//		FileUtil fileUtil = new FileUtil();
//		List<ChPeriodicalThesis> thesisList = fileUtil.importFileOfChPeriodicalThesis(in);
//		return thesisDao.insertList(thesisList);
//	}

	public int insertList(List<ChPeriodicalThesis> thesisList) throws Exception {
		return thesisDao.insertList(thesisList);
	}
}