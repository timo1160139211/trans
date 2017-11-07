package site.gaoyisheng.dao;

import site.gaoyisheng.pojo.AchievementAward;

public interface AchievementAwardMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AchievementAward record);

    int insertSelective(AchievementAward record);

    AchievementAward selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AchievementAward record);

    int updateByPrimaryKey(AchievementAward record);
}