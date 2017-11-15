package site.gaoyisheng.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import site.gaoyisheng.pojo.EnPeriodicalThesis;

public interface EnPeriodicalThesisMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(EnPeriodicalThesis record);

    int insertSelective(EnPeriodicalThesis record);

    EnPeriodicalThesis selectByPrimaryKey(Integer id);
    
    EnPeriodicalThesis selectByKeyId(Integer keyId);
    
    //查询完成与未完成
    //Map<String,Integer> selectStatistic(@Param("status") String status);
    
    //按状态统计数量
    int selectCountByStatus(@Param("status") String status);
    
    //统计所有数量
    int selectCount();
    
    List<EnPeriodicalThesis> selectAll();
    
    //按状态查询
    List<EnPeriodicalThesis> selectByStatus(@Param("status") String status);
    
    List<EnPeriodicalThesis>  selectByMultiConditions(Map<String,String> map);

    int updateByPrimaryKeySelective(EnPeriodicalThesis record);

    int updateByPrimaryKey(EnPeriodicalThesis record);
    
    int insertList(List<EnPeriodicalThesis> thesisList);
}