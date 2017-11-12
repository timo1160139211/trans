package site.gaoyisheng.dao;

import site.gaoyisheng.pojo.EnPeriodicalThesis;

public interface EnPeriodicalThesisMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(EnPeriodicalThesis record);

    int insertSelective(EnPeriodicalThesis record);

    EnPeriodicalThesis selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(EnPeriodicalThesis record);

    int updateByPrimaryKey(EnPeriodicalThesis record);
}