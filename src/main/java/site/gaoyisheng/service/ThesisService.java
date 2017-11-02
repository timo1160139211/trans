/*
 * file_name: ThesisService.java
 *
 * Copyright GaoYisheng Corporation 2017
 *
 * License：
 * date： 2017年11月2日 下午5:12:38
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

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.gaoyisheng.dao.ThesisMapper;
import site.gaoyisheng.pojo.Thesis;

@Service
public class ThesisService {

	@Autowired
	private ThesisMapper thesisDao;
	
	public List<Thesis> selectAllThesis(){
		return thesisDao.selectAllThesis();
	}

	public List<Thesis> selectAllThesisLikeUserName( String name) {
		return thesisDao.selectAllThesisLikeUserName(name);
	}
}
