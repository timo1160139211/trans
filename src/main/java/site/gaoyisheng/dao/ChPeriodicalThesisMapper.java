package site.gaoyisheng.dao;

import site.gaoyisheng.pojo.ChPeriodicalThesis;

public interface ChPeriodicalThesisMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ChPeriodicalThesis record);

    int insertSelective(ChPeriodicalThesis record);

    ChPeriodicalThesis selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ChPeriodicalThesis record);

    int updateByPrimaryKey(ChPeriodicalThesis record);
}