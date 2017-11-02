package site.gaoyisheng.dao;

import java.util.List;

import site.gaoyisheng.pojo.Thesis;

public interface ThesisMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Thesis record);

    int insertSelective(Thesis record);

    Thesis selectByPrimaryKey(Integer id);
    
    List<Thesis> selectAllThesis();

    int updateByPrimaryKeySelective(Thesis record);

    int updateByPrimaryKey(Thesis record);

	List<Thesis> selectAllThesisLikeUserName(String name);
}