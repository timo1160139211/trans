/*
 * file_name: UserMapperImpl.java
 *
 * Copyright GaoYisheng Corporation 2017
 *
 * License：
 * date： 2017年11月1日 下午6:55:18
 *       https://www.gaoyisheng.site
 *       https://github.com/timo1160139211
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package site.gaoyisheng.dao;

import java.io.IOException;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import site.gaoyisheng.pojo.User;
import site.gaoyisheng.utils.MybatisUtil;

public class UserMapperImpl implements UserMapper{

	private SqlSession sqlSession;

	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(User record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(User record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public User selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User selectByNumberAndPassword(Map<String, Object> param) {
		User user = null;
		try {
			MybatisUtil mybatisUtil = new MybatisUtil();
			sqlSession = mybatisUtil.getSqlSession();
			user = sqlSession.selectOne("selectByNumberAndPassword", param);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (sqlSession != null) {
				sqlSession.close();
			}
		}
		
		return user;
	}

	@Override
	public int updateByPrimaryKeySelective(User record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(User record) {
		// TODO Auto-generated method stub
		return 0;
	}

}
