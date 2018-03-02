package site.gaoyisheng.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import site.gaoyisheng.pojo.College;

public interface CollegeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(College record);

    int insertSelective(College record);

    College selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(College record);

    int updateByPrimaryKey(College record);
    
    List<College> selectAll();
    
    List<College> searchCollegeFuzzyQuery(College record);
    
    List<College> searchByName(@Param(value="name")String name);
}