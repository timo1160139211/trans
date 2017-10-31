package site.gaoyisheng.service;

import java.util.List;
import java.util.Map;

import site.gaoyisheng.pojo.User11;
import site.gaoyisheng.pojo.User11;

public interface UserService {
	User11 selectUserByPrimaryKey(Integer userId);

	List<User11> selectAllUser();
	
	List<User11> selectByTeamId(Integer teamId);

	List<User11> selectAllUserByIdentity(String identity);

	int insertUser(User11 user);

	int insertCacheId(User11 user);

	List<User11> selectAllUserExceptIdentity(String identity);

	int updateByPrimaryKey(User11 user);
	
	int updateByPrimaryKeySelective(User11 user);
	
	int deleteByPrimaryKey(Integer id);
	
	List<UserTeamForm> selectByTeacherIdAndTeamId(Integer teacherId,Integer teamId);
}
