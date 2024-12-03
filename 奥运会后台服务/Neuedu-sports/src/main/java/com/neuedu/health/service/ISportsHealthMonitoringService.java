package com.neuedu.health.service;

import java.util.List;
import com.neuedu.health.domain.SportsHealthMonitoring;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 健康监测Service接口
 * 
 * @author ruoyi
 * @date 2024-11-12
 */
public interface ISportsHealthMonitoringService extends IService<SportsHealthMonitoring>
{
    /**
     * 查询健康监测
     * 
     * @param id 健康监测主键
     * @return 健康监测
     */
    public SportsHealthMonitoring selectSportsHealthMonitoringById(Long id);

    /**
     * 查询健康监测列表
     * 
     * @param sportsHealthMonitoring 健康监测
     * @return 健康监测集合
     */
    public List<SportsHealthMonitoring> selectSportsHealthMonitoringList(SportsHealthMonitoring sportsHealthMonitoring);

    /**
     * 新增健康监测
     * 
     * @param sportsHealthMonitoring 健康监测
     * @return 结果
     */
    public int insertSportsHealthMonitoring(SportsHealthMonitoring sportsHealthMonitoring);

    /**
     * 修改健康监测
     * 
     * @param sportsHealthMonitoring 健康监测
     * @return 结果
     */
    public int updateSportsHealthMonitoring(SportsHealthMonitoring sportsHealthMonitoring);

    /**
     * 批量删除健康监测
     * 
     * @param ids 需要删除的健康监测主键集合
     * @return 结果
     */
    public int deleteSportsHealthMonitoringByIds(Long[] ids);

    /**
     * 删除健康监测信息
     * 
     * @param id 健康监测主键
     * @return 结果
     */
    public int deleteSportsHealthMonitoringById(Long id);
}
