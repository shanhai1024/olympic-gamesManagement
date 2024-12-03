package com.neuedu.health.service.impl;
import lombok.RequiredArgsConstructor;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.neuedu.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.neuedu.health.mapper.SportsHealthMonitoringMapper;
import com.neuedu.health.domain.SportsHealthMonitoring;
import com.neuedu.health.service.ISportsHealthMonitoringService;

/**
 * 健康监测Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-11-12
 */
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsHealthMonitoringServiceImpl extends ServiceImpl<SportsHealthMonitoringMapper, SportsHealthMonitoring> implements ISportsHealthMonitoringService
{
    private final SportsHealthMonitoringMapper sportsHealthMonitoringMapper;

    /**
     * 查询健康监测
     * 
     * @param id 健康监测主键
     * @return 健康监测
     */
    @Override
    public SportsHealthMonitoring selectSportsHealthMonitoringById(Long id)
    {
        return sportsHealthMonitoringMapper.selectSportsHealthMonitoringById(id);
    }

    /**
     * 查询健康监测列表
     * 
     * @param sportsHealthMonitoring 健康监测
     * @return 健康监测
     */
    @Override
    public List<SportsHealthMonitoring> selectSportsHealthMonitoringList(SportsHealthMonitoring sportsHealthMonitoring)
    {
        return sportsHealthMonitoringMapper.selectSportsHealthMonitoringList(sportsHealthMonitoring);
    }

    /**
     * 新增健康监测
     * 
     * @param sportsHealthMonitoring 健康监测
     * @return 结果
     */
    @Override
    public int insertSportsHealthMonitoring(SportsHealthMonitoring sportsHealthMonitoring)
    {
        sportsHealthMonitoring.setCreateTime(DateUtils.getNowDate());
        return sportsHealthMonitoringMapper.insertSportsHealthMonitoring(sportsHealthMonitoring);
    }

    /**
     * 修改健康监测
     * 
     * @param sportsHealthMonitoring 健康监测
     * @return 结果
     */
    @Override
    public int updateSportsHealthMonitoring(SportsHealthMonitoring sportsHealthMonitoring)
    {
        sportsHealthMonitoring.setUpdateTime(DateUtils.getNowDate());
        return sportsHealthMonitoringMapper.updateSportsHealthMonitoring(sportsHealthMonitoring);
    }

    /**
     * 批量删除健康监测
     * 
     * @param ids 需要删除的健康监测主键
     * @return 结果
     */
    @Override
    public int deleteSportsHealthMonitoringByIds(Long[] ids)
    {
        return sportsHealthMonitoringMapper.deleteSportsHealthMonitoringByIds(ids);
    }

    /**
     * 删除健康监测信息
     * 
     * @param id 健康监测主键
     * @return 结果
     */
    @Override
    public int deleteSportsHealthMonitoringById(Long id)
    {
        return sportsHealthMonitoringMapper.deleteSportsHealthMonitoringById(id);
    }
}
