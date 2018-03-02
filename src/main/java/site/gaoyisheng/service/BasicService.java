/*
 * file_name: BasicService.java
 *
 * Copyright GaoYisheng Corporation 2017
 *
 * License：
 * date： 2018年2月23日 下午2:39:34
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


/**
 * .
 * 抽象接口类
 * @author gaoyisheng
 *
 * @param <T>
 */
public abstract class BasicService<T> {
    
	/**
	 * .
	 * 查询所有
	 * @return
	 */
	public abstract List<T> selectAll();
	
	/**
	 * .
	 * 主键(Id)查找
	 * @return
	 */
	public abstract T selectByPrimaryKey(Integer id);
	
	/**
	 * .
	 * 模糊查找,参数为该类型
	 * @param t
	 * @return
	 */
	public abstract List<T> searchFuzzyQuery(T t);
	
	/**
	 * .
	 * 按认领状态查找
	 * @param status
	 * @return
	 */
	public List<T> selectByStatus(String status){
		return null;
	}
	
	/**
	 * .
	 * TODO 通过主键更新.(值为  null , '' 的字段将不被更新)
	 * @param  t
	 * @return
	 */
	public abstract int updateByPrimaryKeySelective(T t);
	
	/**
	 * .
	 * TODO 删除用户by PK
	 * @param id
	 * @return
	 */
	public abstract int deleteByPrimaryKey(Integer id);

	/**
	 * . 
	 * TODO 增
	 * @param c
	 * @return
	 */
	public abstract int create(T c);
	
}
