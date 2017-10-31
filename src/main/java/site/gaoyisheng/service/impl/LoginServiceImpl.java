package site.gaoyisheng.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.gaoyisheng.dao.UserMapper11;
import site.gaoyisheng.pojo.User11;
import site.gaoyisheng.service.LoginService;

@Service("loginService")
public class LoginServiceImpl implements LoginService {

	@Autowired
	private UserMapper11 userDao;

	@Override
	public User11 selectByNumberAndPassword(Map<String, Object> param) {
		return this.userDao.selectByNumberAndPassword(param);
	}

}
