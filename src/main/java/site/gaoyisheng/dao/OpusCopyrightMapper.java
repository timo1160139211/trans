package site.gaoyisheng.dao;

import site.gaoyisheng.pojo.OpusCopyright;

public interface OpusCopyrightMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OpusCopyright record);

    int insertSelective(OpusCopyright record);

    OpusCopyright selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OpusCopyright record);

    int updateByPrimaryKey(OpusCopyright record);
}