package com.neuedu.sports.mapper;

import java.util.List;
import com.neuedu.sports.domain.SportsAthletePersonalInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
/**
 * 运动员管理-个人信息管理Mapper接口
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Mapper
public interface SportsAthletePersonalInfoMapper extends BaseMapper<SportsAthletePersonalInfo>
{
    /**
     * 查询运动员管理-个人信息管理
     * 
     * @param id 运动员管理-个人信息管理主键
     * @return 运动员管理-个人信息管理
     */
    public SportsAthletePersonalInfo selectSportsAthletePersonalInfoById(Long id);

    /**
     * 查询运动员管理-个人信息管理列表
     * 
     * @param sportsAthletePersonalInfo 运动员管理-个人信息管理
     * @return 运动员管理-个人信息管理集合
     */
    public List<SportsAthletePersonalInfo> selectSportsAthletePersonalInfoList(SportsAthletePersonalInfo sportsAthletePersonalInfo);

    /**
     * 新增运动员管理-个人信息管理
     * 
     * @param sportsAthletePersonalInfo 运动员管理-个人信息管理
     * @return 结果
     */
    public int insertSportsAthletePersonalInfo(SportsAthletePersonalInfo sportsAthletePersonalInfo);

    /**
     * 修改运动员管理-个人信息管理
     * 
     * @param sportsAthletePersonalInfo 运动员管理-个人信息管理
     * @return 结果
     */
    public int updateSportsAthletePersonalInfo(SportsAthletePersonalInfo sportsAthletePersonalInfo);

    /**
     * 删除运动员管理-个人信息管理
     * 
     * @param id 运动员管理-个人信息管理主键
     * @return 结果
     */
    public int deleteSportsAthletePersonalInfoById(Long id);

    /**
     * 批量删除运动员管理-个人信息管理
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSportsAthletePersonalInfoByIds(Long[] ids);
}
