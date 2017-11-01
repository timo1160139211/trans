package site.gaoyisheng.service;

import java.util.Map;

import site.gaoyisheng.pojo.User;

public interface LoginService {
	 public User selectByNumberAndPassword(Map<String,Object> param);  
}
