package com.neuedu.sports.service.impl;
import lombok.RequiredArgsConstructor;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.neuedu.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.neuedu.sports.mapper.SportsAthletePerformanceTrackingMapper;
import com.neuedu.sports.domain.SportsAthletePerformanceTracking;
import com.neuedu.sports.service.ISportsAthletePerformanceTrackingService;

/**
 * 运动员管理-现追踪Service业务层处理
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsAthletePerformanceTrackingServiceImpl extends ServiceImpl<SportsAthletePerformanceTrackingMapper, SportsAthletePerformanceTracking> implements ISportsAthletePerformanceTrackingService
{
    private final SportsAthletePerformanceTrackingMapper sportsAthletePerformanceTrackingMapper;

    /**
     * 查询运动员管理-现追踪
     * 
     * @param id 运动员管理-现追踪主键
     * @return 运动员管理-现追踪
     */
    @Override
    public SportsAthletePerformanceTracking selectSportsAthletePerformanceTrackingById(Long id)
    {
        return sportsAthletePerformanceTrackingMapper.selectSportsAthletePerformanceTrackingById(id);
    }

    /**
     * 查询运动员管理-现追踪列表
     * 
     * @param sportsAthletePerformanceTracking 运动员管理-现追踪
     * @return 运动员管理-现追踪
     */
    @Override
    public List<SportsAthletePerformanceTracking> selectSportsAthletePerformanceTrackingList(SportsAthletePerformanceTracking sportsAthletePerformanceTracking)
    {
        return sportsAthletePerformanceTrackingMapper.selectSportsAthletePerformanceTrackingList(sportsAthletePerformanceTracking);
    }

    /**
     * 新增运动员管理-现追踪
     * 
     * @param sportsAthletePerformanceTracking 运动员管理-现追踪
     * @return 结果
     */
    @Override
    public int insertSportsAthletePerformanceTracking(SportsAthletePerformanceTracking sportsAthletePerformanceTracking)
    {
        sportsAthletePerformanceTracking.setCreateTime(DateUtils.getNowDate());
        return sportsAthletePerformanceTrackingMapper.insertSportsAthletePerformanceTracking(sportsAthletePerformanceTracking);
    }

    /**
     * 修改运动员管理-现追踪
     * 
     * @param sportsAthletePerformanceTracking 运动员管理-现追踪
     * @return 结果
     */
    @Override
    public int updateSportsAthletePerformanceTracking(SportsAthletePerformanceTracking sportsAthletePerformanceTracking)
    {
        sportsAthletePerformanceTracking.setUpdateTime(DateUtils.getNowDate());
        return sportsAthletePerformanceTrackingMapper.updateSportsAthletePerformanceTracking(sportsAthletePerformanceTracking);
    }

    /**
     * 批量删除运动员管理-现追踪
     * 
     * @param ids 需要删除的运动员管理-现追踪主键
     * @return 结果
     */
    @Override
    public int deleteSportsAthletePerformanceTrackingByIds(Long[] ids)
    {
        return sportsAthletePerformanceTrackingMapper.deleteSportsAthletePerformanceTrackingByIds(ids);
    }

    /**
     * 删除运动员管理-现追踪信息
     * 
     * @param id 运动员管理-现追踪主键
     * @return 结果
     */
    @Override
    public int deleteSportsAthletePerformanceTrackingById(Long id)
    {
        return sportsAthletePerformanceTrackingMapper.deleteSportsAthletePerformanceTrackingById(id);
    }
}
