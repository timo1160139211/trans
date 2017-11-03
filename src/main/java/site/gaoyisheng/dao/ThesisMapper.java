package site.gaoyisheng.dao;

import java.util.List;

import site.gaoyisheng.pojo.Thesis;
import site.gaoyisheng.pojo.User;

public interface ThesisMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Thesis record);

    int insertSelective(Thesis record);

    Thesis selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Thesis record);

    int updateByPrimaryKey(Thesis record);

	List<Thesis> selectAllThesisLikeUserNameAndNumber(User user);

	List<Thesis> selectAllThesis();
}