package com.neuedu.sports.service.impl;
import lombok.RequiredArgsConstructor;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.neuedu.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.neuedu.sports.mapper.SportsAthletePersonalInfoMapper;
import com.neuedu.sports.domain.SportsAthletePersonalInfo;
import com.neuedu.sports.service.ISportsAthletePersonalInfoService;

/**
 * 运动员管理-个人信息管理Service业务层处理
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsAthletePersonalInfoServiceImpl extends ServiceImpl<SportsAthletePersonalInfoMapper, SportsAthletePersonalInfo> implements ISportsAthletePersonalInfoService
{
    private final SportsAthletePersonalInfoMapper sportsAthletePersonalInfoMapper;

    /**
     * 查询运动员管理-个人信息管理
     * 
     * @param id 运动员管理-个人信息管理主键
     * @return 运动员管理-个人信息管理
     */
    @Override
    public SportsAthletePersonalInfo selectSportsAthletePersonalInfoById(Long id)
    {
        return sportsAthletePersonalInfoMapper.selectSportsAthletePersonalInfoById(id);
    }

    /**
     * 查询运动员管理-个人信息管理列表
     * 
     * @param sportsAthletePersonalInfo 运动员管理-个人信息管理
     * @return 运动员管理-个人信息管理
     */
    @Override
    public List<SportsAthletePersonalInfo> selectSportsAthletePersonalInfoList(SportsAthletePersonalInfo sportsAthletePersonalInfo)
    {
        return sportsAthletePersonalInfoMapper.selectSportsAthletePersonalInfoList(sportsAthletePersonalInfo);
    }

    /**
     * 新增运动员管理-个人信息管理
     * 
     * @param sportsAthletePersonalInfo 运动员管理-个人信息管理
     * @return 结果
     */
    @Override
    public int insertSportsAthletePersonalInfo(SportsAthletePersonalInfo sportsAthletePersonalInfo)
    {
        sportsAthletePersonalInfo.setCreateTime(DateUtils.getNowDate());
        return sportsAthletePersonalInfoMapper.insertSportsAthletePersonalInfo(sportsAthletePersonalInfo);
    }

    /**
     * 修改运动员管理-个人信息管理
     * 
     * @param sportsAthletePersonalInfo 运动员管理-个人信息管理
     * @return 结果
     */
    @Override
    public int updateSportsAthletePersonalInfo(SportsAthletePersonalInfo sportsAthletePersonalInfo)
    {
        sportsAthletePersonalInfo.setUpdateTime(DateUtils.getNowDate());
        return sportsAthletePersonalInfoMapper.updateSportsAthletePersonalInfo(sportsAthletePersonalInfo);
    }

    /**
     * 批量删除运动员管理-个人信息管理
     * 
     * @param ids 需要删除的运动员管理-个人信息管理主键
     * @return 结果
     */
    @Override
    public int deleteSportsAthletePersonalInfoByIds(Long[] ids)
    {
        return sportsAthletePersonalInfoMapper.deleteSportsAthletePersonalInfoByIds(ids);
    }

    /**
     * 删除运动员管理-个人信息管理信息
     * 
     * @param id 运动员管理-个人信息管理主键
     * @return 结果
     */
    @Override
    public int deleteSportsAthletePersonalInfoById(Long id)
    {
        return sportsAthletePersonalInfoMapper.deleteSportsAthletePersonalInfoById(id);
    }
}
