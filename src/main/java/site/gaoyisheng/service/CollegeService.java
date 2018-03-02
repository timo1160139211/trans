/*
 * file_name: CollegeService.java
 *
 * Copyright GaoYisheng Corporation 2017
 *
 * License：
 * date： 2018年2月26日 下午8:16:20
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

import site.gaoyisheng.dao.CollegeMapper;
import site.gaoyisheng.pojo.College;

@Service
public class CollegeService extends BasicService<College> {

	@Autowired
	private CollegeMapper dao;
	
	@Override
	public List<College> selectAll() {
		return dao.selectAll();
	}

	@Override
	public College selectByPrimaryKey(Integer id) {
		return dao.selectByPrimaryKey(id);
	}

	/**
	 * .
	 * TODO 通过名称模糊查找
	 * @param c
	 * @return
	 */
	public List<College> searchByName(String c) {
		return dao.searchByName(c);
	}
	
	@Override
	public List<College> searchFuzzyQuery(College c) {
		return dao.searchCollegeFuzzyQuery(c);
	}

	@Override
	public int updateByPrimaryKeySelective(College c) {
		return dao.updateByPrimaryKeySelective(c);
	}

	@Override
	public int deleteByPrimaryKey(Integer id) {
		return dao.deleteByPrimaryKey(id);
	}
	
	@Override
	public int create(College c) {
		return dao.insert(c);
	}

}
