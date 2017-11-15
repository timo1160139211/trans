package site.gaoyisheng.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import site.gaoyisheng.pojo.ChPeriodicalThesis;

public interface ChPeriodicalThesisMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ChPeriodicalThesis record);

    int insertSelective(ChPeriodicalThesis record);

    ChPeriodicalThesis selectByPrimaryKey(Integer id);
    
    ChPeriodicalThesis selectByKeyId(Integer keyId);
    
    //查询完成与未完成
    //Map<String,Integer> selectStatistic(@Param("status") String status);
    
    //按状态统计数量
    int selectCountByStatus(@Param("status") String status);
    
    //统计所有数量
    int selectCount();
    
    List<ChPeriodicalThesis> selectAll();
    
    //按状态查询
    List<ChPeriodicalThesis> selectByStatus(@Param("status") String status);
    
    List<ChPeriodicalThesis>  selectByMultiConditions(Map<String,String> map);

    int updateByPrimaryKeySelective(ChPeriodicalThesis record);

    int updateByPrimaryKey(ChPeriodicalThesis record);
    
    int insertList(List<ChPeriodicalThesis> thesisList);
}