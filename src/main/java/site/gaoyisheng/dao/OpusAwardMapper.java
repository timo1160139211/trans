package site.gaoyisheng.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import site.gaoyisheng.pojo.OpusAward;

public interface OpusAwardMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OpusAward record);

    int insertSelective(OpusAward record);

    OpusAward selectByPrimaryKey(Integer id);
    
    OpusAward selectByKeyId(Integer keyId);
    
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
    
    List<OpusAward> selectAll();
    
    /**
     * .
     * TODO 按状态查询
     * @param status
     * @return
     */
    List<OpusAward> selectByStatus(@Param("status") String status);
    
    /**
     * .
     * TODO 按状态查询,+分页参数:重载
     * @param status
     * @param pageNum
     * @param pageSize
     * @return
     */
    List<OpusAward> selectByStatus(@Param("status") String status,@Param("pageNum") int pageNum,@Param("pageSize") int pageSize);
    
    /**
     * .
     * TODO 多条件查询
     * @param map
     * @return
     */
    List<OpusAward>  selectByMultiConditions(Map<String,String> map);

    /**
     * .
     * TODO 多条件查询,+分页参数:重载
     * @param map
     * @return
     */
    List<OpusAward>  selectByMultiConditions(Map<String,String> map,@Param("pageNum") int pageNum,@Param("pageSize") int pageSize);

    int updateByPrimaryKeySelective(OpusAward record);

    int updateByPrimaryKey(OpusAward record);
    
    int insertList(List<OpusAward> list);
}