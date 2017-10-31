package site.gaoyisheng.service;

import java.util.Map;

import site.gaoyisheng.pojo.User11;

public interface LoginService {
	 public User11 selectByNumberAndPassword(Map<String,Object> param);  
}
