package site.gaoyisheng.dao;

import java.util.Map;

import site.gaoyisheng.pojo.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    User selectByNumberAndPassword(Map<String, Object> param);
    
    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}