package site.gaoyisheng.dao;

import java.util.List;
import java.util.Map;

import site.gaoyisheng.pojo.EnPeriodicalThesis;

public interface EnPeriodicalThesisMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(EnPeriodicalThesis record);

    int insertSelective(EnPeriodicalThesis record);

    EnPeriodicalThesis selectByPrimaryKey(Integer id);
    
    EnPeriodicalThesis selectByKeyId(Integer keyId);
    
    List<EnPeriodicalThesis> selectAll();
    
    List<EnPeriodicalThesis>  selectByMultiConditions(Map<String,String> map);

    int updateByPrimaryKeySelective(EnPeriodicalThesis record);

    int updateByPrimaryKey(EnPeriodicalThesis record);
    
    int insertList(List<EnPeriodicalThesis> thesisList);
}