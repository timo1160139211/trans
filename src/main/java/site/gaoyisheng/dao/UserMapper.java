package site.gaoyisheng.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import site.gaoyisheng.pojo.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    User selectByNumberAndPassword(Map<String, Object> param);
    
    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    List<User> selectAllUser();
    
    List<User> selectBySelectiveParam(User u);
    
    int insertList(List<User> userList);
    
    List<User> selectByFuzzyName(@Param("name")String name);
}