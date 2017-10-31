package site.gaoyisheng.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import site.gaoyisheng.dao.UserMapper11;
import site.gaoyisheng.pojo.User11;
import site.gaoyisheng.pojo.User11;
import site.gaoyisheng.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper11 userDao;

	/**
	 * select user by PK.
	 */
	@Override
	public User11 selectUserByPrimaryKey(Integer userId) {
		return this.userDao.selectByPrimaryKey(userId);
	}

	@Override
	public List<User11> selectAllUser() {
		return userDao.selectAllUser();
	}
	
	@Override
	public List<User11> selectAllUserByIdentity(String identity) {
		return userDao.selectAllUserByIdentity(identity);
	}
	
	@Override
	@Cacheable("all_user_except_stu")
	public List<User11> selectAllUserExceptIdentity(String identity) {
		System.out.println("AllUserExceptIdentity cache saved ????=============");
		return userDao.selectAllUserExceptIdentity(identity);
	}
	
	/**
	 * insert user .
	 * @param user
	 */
	@Override
	public int insertUser(User11 user) {
		return this.userDao.insertSelective(user);
	}
	
	/**
	 * insert user .
	 * @param user
	 * @return 返回的并不是id,而是 0,1 = false,true
	 */
	@Override
	public int insertCacheId(User11 user) {
		return this.userDao.insertCacheId(user);
	}

	@Override
	public int updateByPrimaryKey(User11 user) {
		return this.userDao.updateByPrimaryKey(user);
	}

	@Override
	public int deleteByPrimaryKey(Integer id) {
		return this.userDao.deleteByPrimaryKey(id);
	}

	@Override
	public List<User11> selectByTeamId(Integer teamId) {
		return userDao.selectByTeamId(teamId);
	}

	@Override
	public int updateByPrimaryKeySelective(User11 user) {
		return this.userDao.updateByPrimaryKeySelective(user);
	}

	@Override
	public List<UserTeamForm> selectByTeacherIdAndTeamId(Integer teacherId, Integer teamId) {
		Map<String, Integer> parameterMap = new HashMap<String, Integer>();
		parameterMap.put("teacherId", teacherId);
		parameterMap.put("teamId", teamId);
		return this.userDao.selectByTeacherIdAndTeamId(parameterMap);
	}
}
