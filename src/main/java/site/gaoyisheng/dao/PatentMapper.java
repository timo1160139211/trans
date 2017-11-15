package site.gaoyisheng.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import site.gaoyisheng.pojo.Patent;

public interface PatentMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Patent record);

    int insertSelective(Patent record);

    Patent selectByPrimaryKey(Integer id);
    
    Patent selectByKeyId(Integer keyId);
    
    //查询完成与未完成
    //Map<String,Integer> selectStatistic(@Param("status") String status);
    
    //按状态统计数量
    int selectCountByStatus(@Param("status") String status);
    
    //统计所有数量
    int selectCount();
    
    List<Patent> selectAll();
    
    //按状态查询
    List<Patent> selectByStatus(@Param("status") String status);
    
    List<Patent>  selectByMultiConditions(Map<String,String> map);

    int updateByPrimaryKeySelective(Patent record);

    int updateByPrimaryKey(Patent record);
    
    int insertList(List<Patent> thesisList);
}