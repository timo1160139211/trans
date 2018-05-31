package site.gaoyisheng.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import site.gaoyisheng.pojo.AchievementAward;

public interface AchievementAwardMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AchievementAward record);

    int insertSelective(AchievementAward record);

    AchievementAward selectByPrimaryKey(Integer id);
    
    AchievementAward selectByKeyId(Integer keyId);
    
    /**
     * .
     * TODO 按状态统计数量
     * @param status
     * @return
     */
    int selectCountByStatus(@Param("status") String status);
    
    /**
     * .
     * TODO 统计所有数量
     * @return
     */
    int selectCount();
    
    List<AchievementAward> selectAll();
    
    /**
     * .
     * TODO 按状态查询
     * @param status
     * @return
     */
    List<AchievementAward> selectByStatus(@Param("status") String status);
    
    /**
     * .
     * TODO 按状态查询,+分页参数:重载
     * @param status
     * @param pageNum
     * @param pageSize
     * @return
     */
    List<AchievementAward> selectByStatus(@Param("status") String status,@Param("pageNum") int pageNum,@Param("pageSize") int pageSize);
    
    /**
     * .
     * TODO 多条件查询
     * @param map
     * @return
     */
    List<AchievementAward>  selectByMultiConditions(Map<String,String> map);

    /**
     * .
     * TODO 多条件查询,+分页参数:重载
     * @param map
     * @return
     */
    List<AchievementAward>  selectByMultiConditions(Map<String,String> map,@Param("pageNum") int pageNum,@Param("pageSize") int pageSize);

    int updateByPrimaryKeySelective(AchievementAward record);

    int updateByPrimaryKey(AchievementAward record);
    
    int insertList(List<AchievementAward> list);
}