package site.gaoyisheng.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import site.gaoyisheng.pojo.ChPeriodicalThesis;
import site.gaoyisheng.pojo.Patent;

public interface PatentMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Patent record);

    int insertSelective(Patent record);

    Patent selectByPrimaryKey(Integer id);
    
    Patent selectByKeyId(Integer keyId);
    
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
    
    List<Patent> selectAll();
    
    /**
     * .
     * TODO 按状态查询
     * @param status
     * @return
     */
    List<Patent> selectByStatus(@Param("status") String status);
    
    /**
     * .
     * TODO 按状态查询,+分页参数:重载
     * @param status
     * @param pageNum
     * @param pageSize
     * @return
     */
    List<Patent> selectByStatus(@Param("status") String status,@Param("pageNum") int pageNum,@Param("pageSize") int pageSize);
    
    /**
     * .
     * TODO 多条件查询
     * @param map
     * @return
     */
    List<Patent>  selectByMultiConditions(Map<String,String> map);

    /**
     * .
     * TODO 多条件查询,+分页参数:重载
     * @param map
     * @return
     */
    List<Patent>  selectByMultiConditions(Map<String,String> map,@Param("pageNum") int pageNum,@Param("pageSize") int pageSize);

    int updateByPrimaryKeySelective(Patent record);

    int updateByPrimaryKey(Patent record);
    
    int insertList(List<Patent> thesisList);
}