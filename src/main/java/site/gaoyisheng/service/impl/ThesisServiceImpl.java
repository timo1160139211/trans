/*
 * file_name: ThesisServiceImpl.java
 *
 * Copyright GaoYisheng Corporation 2017
 *
 * License：
 * date： 2017年11月1日 上午11:10:38
 *       https://www.gaoyisheng.site
 *       https://github.com/timo1160139211
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package site.gaoyisheng.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.gaoyisheng.dao.ThesisMapper;
import site.gaoyisheng.pojo.Thesis;
import site.gaoyisheng.service.ThesisService;


@Service("thesisService")
public class ThesisServiceImpl implements ThesisService {

	@Autowired
	private ThesisMapper thesisDao;

	@Override
	public List<Thesis> selectAllUser() {
		return thesisDao.selectAllThesis();
	}

}
