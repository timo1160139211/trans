/*
 * file_name: UserService.java
 *
 * Copyright GaoYisheng Corporation 2017
 *
 * License：
 * date： 2017年11月2日 下午4:10:45
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

import site.gaoyisheng.dao.UserMapper;
import site.gaoyisheng.pojo.User;

@Service
public class UserService {

	@Autowired
	private UserMapper userDao;
	
	/**
	 * .
	 * TODO 多条件查询
	 * @param user
	 * @return
	 */
	public void updateByPrimaryKeySelective(User user) {
		this.userDao.updateByPrimaryKeySelective(user);
	}

	/**
	 * .
	 * TODO 查询所有用户.
	 * @return
	 */
	public List<User> selectAllUser() {
		return this.userDao.selectAllUser();
	}
	
	/**
	 * .
	 * TODO 模糊查询.
	 * @param u
	 * @return
	 */
	public List<User> searchUserFuzzyQuery(User u){
		return this.userDao.selectBySelectiveParam(u);
	}
	
	
	/**
	 * .
	 * TODO 批量插入
	 * @param userList
	 * @return
	 * @throws Exception
	 */
	public int insertList(List<User> userList) throws Exception {
		return userDao.insertList(userList);
	}
}
