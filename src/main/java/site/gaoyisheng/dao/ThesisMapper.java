package site.gaoyisheng.dao;

import site.gaoyisheng.pojo.Thesis;

public interface ThesisMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Thesis record);

    int insertSelective(Thesis record);

    Thesis selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Thesis record);

    int updateByPrimaryKey(Thesis record);
}