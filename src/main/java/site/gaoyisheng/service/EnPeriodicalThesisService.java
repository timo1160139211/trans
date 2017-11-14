/*
 * file_name: EnPeriodicalThesisService.java
 *
 * Copyright GaoYisheng Corporation 2017
 *
 * License：
 * date： 2017年11月14日 上午9:43:20
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
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.gaoyisheng.dao.EnPeriodicalThesisMapper;
import site.gaoyisheng.pojo.EnPeriodicalThesis;
import site.gaoyisheng.utils.FileUtil;

@Service
public class EnPeriodicalThesisService {

	@Autowired
	private EnPeriodicalThesisMapper thesisDao;

	public List<EnPeriodicalThesis> selectAll() {
		return thesisDao.selectAll();
	}

	public EnPeriodicalThesis selectByPrimaryKey(Integer thesisId) {
		return thesisDao.selectByPrimaryKey(thesisId);
	}

	public List<EnPeriodicalThesis> selectByMultiConditions(Map<String,String> map) {
		return thesisDao.selectByMultiConditions(map);
	}
	
	public int readStreamAndInsertList(InputStream in) throws Exception {
		FileUtil fileUtil = new FileUtil();
		List<EnPeriodicalThesis> thesisList = fileUtil.importFileOfEnPeriodicalThesis(in);
		return thesisDao.insertList(thesisList);
	}
	
	public int insertList(List<EnPeriodicalThesis> thesisList) throws Exception {
		return thesisDao.insertList(thesisList);
	}
}
