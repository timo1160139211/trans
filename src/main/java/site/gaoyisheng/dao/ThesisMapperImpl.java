/*
 * file_name: ThesisMapperImpl.java
 *
 * Copyright GaoYisheng Corporation 2017
 *
 * License：
 * date： 2017年11月1日 上午10:52:02
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
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import site.gaoyisheng.pojo.Thesis;
import site.gaoyisheng.pojo.User;
import site.gaoyisheng.utils.MybatisUtil;

public class ThesisMapperImpl implements ThesisMapper {

	private SqlSession sqlSession;

	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(Thesis record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(Thesis record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Thesis selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Thesis> selectAllThesis() {
		List<Thesis> thesisList = null;
		try {
			MybatisUtil mybatisUtil = new MybatisUtil();
			sqlSession = mybatisUtil.getSqlSession();
			thesisList = sqlSession.selectList("selectAllThesis");

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (sqlSession != null) {
				sqlSession.close();
			}
		}

		return thesisList;
	}

	@Override
	public int updateByPrimaryKeySelective(Thesis record) {
		
		try {
			MybatisUtil mybatisUtil = new MybatisUtil();
			sqlSession = mybatisUtil.getSqlSession();
			sqlSession.update("updateByPrimaryKeySelective", record);

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (sqlSession != null) {
				sqlSession.close();
			}
		}

		return 0;
	}

	@Override
	public int updateByPrimaryKey(Thesis record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Thesis> selectAllThesisLikeUserNameAndNumber(User user) {
		List<Thesis> thesisList = null;
		try {
			MybatisUtil mybatisUtil = new MybatisUtil();
			sqlSession = mybatisUtil.getSqlSession();
			thesisList = sqlSession.selectList("selectAllThesisLikeUserName",user);

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (sqlSession != null) {
				sqlSession.close();
			}
		}

		return thesisList;
	}

}
