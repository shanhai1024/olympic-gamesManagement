package com.neuedu.sports.service.impl;
import lombok.RequiredArgsConstructor;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.neuedu.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.neuedu.sports.mapper.SportsEventScheduleMapper;
import com.neuedu.sports.domain.SportsEventSchedule;
import com.neuedu.sports.service.ISportsEventScheduleService;

/**
 * 赛事管理-赛程规划Service业务层处理
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsEventScheduleServiceImpl extends ServiceImpl<SportsEventScheduleMapper, SportsEventSchedule> implements ISportsEventScheduleService
{
    private final SportsEventScheduleMapper sportsEventScheduleMapper;

    /**
     * 查询赛事管理-赛程规划
     * 
     * @param id 赛事管理-赛程规划主键
     * @return 赛事管理-赛程规划
     */
    @Override
    public SportsEventSchedule selectSportsEventScheduleById(Long id)
    {
        return sportsEventScheduleMapper.selectSportsEventScheduleById(id);
    }

    /**
     * 查询赛事管理-赛程规划列表
     * 
     * @param sportsEventSchedule 赛事管理-赛程规划
     * @return 赛事管理-赛程规划
     */
    @Override
    public List<SportsEventSchedule> selectSportsEventScheduleList(SportsEventSchedule sportsEventSchedule)
    {
        return sportsEventScheduleMapper.selectSportsEventScheduleList(sportsEventSchedule);
    }

    /**
     * 新增赛事管理-赛程规划
     * 
     * @param sportsEventSchedule 赛事管理-赛程规划
     * @return 结果
     */
    @Override
    public int insertSportsEventSchedule(SportsEventSchedule sportsEventSchedule)
    {
        sportsEventSchedule.setCreateTime(DateUtils.getNowDate());
        return sportsEventScheduleMapper.insertSportsEventSchedule(sportsEventSchedule);
    }

    /**
     * 修改赛事管理-赛程规划
     * 
     * @param sportsEventSchedule 赛事管理-赛程规划
     * @return 结果
     */
    @Override
    public int updateSportsEventSchedule(SportsEventSchedule sportsEventSchedule)
    {
        sportsEventSchedule.setUpdateTime(DateUtils.getNowDate());
        return sportsEventScheduleMapper.updateSportsEventSchedule(sportsEventSchedule);
    }

    /**
     * 批量删除赛事管理-赛程规划
     * 
     * @param ids 需要删除的赛事管理-赛程规划主键
     * @return 结果
     */
    @Override
    public int deleteSportsEventScheduleByIds(Long[] ids)
    {
        return sportsEventScheduleMapper.deleteSportsEventScheduleByIds(ids);
    }

    /**
     * 删除赛事管理-赛程规划信息
     * 
     * @param id 赛事管理-赛程规划主键
     * @return 结果
     */
    @Override
    public int deleteSportsEventScheduleById(Long id)
    {
        return sportsEventScheduleMapper.deleteSportsEventScheduleById(id);
    }
}
