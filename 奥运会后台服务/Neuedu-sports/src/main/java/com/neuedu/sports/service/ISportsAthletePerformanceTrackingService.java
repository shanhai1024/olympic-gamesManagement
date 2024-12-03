package com.neuedu.sports.service;

import java.util.List;
import com.neuedu.sports.domain.SportsAthletePerformanceTracking;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 运动员管理-现追踪Service接口
 * 
 * @author neuedu
 * @date 2024-06-12
 */
public interface ISportsAthletePerformanceTrackingService extends IService<SportsAthletePerformanceTracking>
{
    /**
     * 查询运动员管理-现追踪
     * 
     * @param id 运动员管理-现追踪主键
     * @return 运动员管理-现追踪
     */
    public SportsAthletePerformanceTracking selectSportsAthletePerformanceTrackingById(Long id);

    /**
     * 查询运动员管理-现追踪列表
     * 
     * @param sportsAthletePerformanceTracking 运动员管理-现追踪
     * @return 运动员管理-现追踪集合
     */
    public List<SportsAthletePerformanceTracking> selectSportsAthletePerformanceTrackingList(SportsAthletePerformanceTracking sportsAthletePerformanceTracking);

    /**
     * 新增运动员管理-现追踪
     * 
     * @param sportsAthletePerformanceTracking 运动员管理-现追踪
     * @return 结果
     */
    public int insertSportsAthletePerformanceTracking(SportsAthletePerformanceTracking sportsAthletePerformanceTracking);

    /**
     * 修改运动员管理-现追踪
     * 
     * @param sportsAthletePerformanceTracking 运动员管理-现追踪
     * @return 结果
     */
    public int updateSportsAthletePerformanceTracking(SportsAthletePerformanceTracking sportsAthletePerformanceTracking);

    /**
     * 批量删除运动员管理-现追踪
     * 
     * @param ids 需要删除的运动员管理-现追踪主键集合
     * @return 结果
     */
    public int deleteSportsAthletePerformanceTrackingByIds(Long[] ids);

    /**
     * 删除运动员管理-现追踪信息
     * 
     * @param id 运动员管理-现追踪主键
     * @return 结果
     */
    public int deleteSportsAthletePerformanceTrackingById(Long id);
}
