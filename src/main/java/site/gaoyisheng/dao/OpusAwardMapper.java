package site.gaoyisheng.dao;

import site.gaoyisheng.pojo.OpusAward;

public interface OpusAwardMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OpusAward record);

    int insertSelective(OpusAward record);

    OpusAward selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OpusAward record);

    int updateByPrimaryKey(OpusAward record);
}