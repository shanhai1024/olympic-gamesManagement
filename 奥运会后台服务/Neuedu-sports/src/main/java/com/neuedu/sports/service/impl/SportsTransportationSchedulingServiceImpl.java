package com.neuedu.sports.service.impl;
import lombok.RequiredArgsConstructor;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.neuedu.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.neuedu.sports.mapper.SportsTransportationSchedulingMapper;
import com.neuedu.sports.domain.SportsTransportationScheduling;
import com.neuedu.sports.service.ISportsTransportationSchedulingService;

/**
 * 住宿与交通调度-交通调度Service业务层处理
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsTransportationSchedulingServiceImpl extends ServiceImpl<SportsTransportationSchedulingMapper, SportsTransportationScheduling> implements ISportsTransportationSchedulingService
{
    private final SportsTransportationSchedulingMapper sportsTransportationSchedulingMapper;

    /**
     * 查询住宿与交通调度-交通调度
     * 
     * @param id 住宿与交通调度-交通调度主键
     * @return 住宿与交通调度-交通调度
     */
    @Override
    public SportsTransportationScheduling selectSportsTransportationSchedulingById(Long id)
    {
        return sportsTransportationSchedulingMapper.selectSportsTransportationSchedulingById(id);
    }

    /**
     * 查询住宿与交通调度-交通调度列表
     * 
     * @param sportsTransportationScheduling 住宿与交通调度-交通调度
     * @return 住宿与交通调度-交通调度
     */
    @Override
    public List<SportsTransportationScheduling> selectSportsTransportationSchedulingList(SportsTransportationScheduling sportsTransportationScheduling)
    {
        return sportsTransportationSchedulingMapper.selectSportsTransportationSchedulingList(sportsTransportationScheduling);
    }

    /**
     * 新增住宿与交通调度-交通调度
     * 
     * @param sportsTransportationScheduling 住宿与交通调度-交通调度
     * @return 结果
     */
    @Override
    public int insertSportsTransportationScheduling(SportsTransportationScheduling sportsTransportationScheduling)
    {
        sportsTransportationScheduling.setCreateTime(DateUtils.getNowDate());
        return sportsTransportationSchedulingMapper.insertSportsTransportationScheduling(sportsTransportationScheduling);
    }

    /**
     * 修改住宿与交通调度-交通调度
     * 
     * @param sportsTransportationScheduling 住宿与交通调度-交通调度
     * @return 结果
     */
    @Override
    public int updateSportsTransportationScheduling(SportsTransportationScheduling sportsTransportationScheduling)
    {
        sportsTransportationScheduling.setUpdateTime(DateUtils.getNowDate());
        return sportsTransportationSchedulingMapper.updateSportsTransportationScheduling(sportsTransportationScheduling);
    }

    /**
     * 批量删除住宿与交通调度-交通调度
     * 
     * @param ids 需要删除的住宿与交通调度-交通调度主键
     * @return 结果
     */
    @Override
    public int deleteSportsTransportationSchedulingByIds(Long[] ids)
    {
        return sportsTransportationSchedulingMapper.deleteSportsTransportationSchedulingByIds(ids);
    }

    /**
     * 删除住宿与交通调度-交通调度信息
     * 
     * @param id 住宿与交通调度-交通调度主键
     * @return 结果
     */
    @Override
    public int deleteSportsTransportationSchedulingById(Long id)
    {
        return sportsTransportationSchedulingMapper.deleteSportsTransportationSchedulingById(id);
    }
}
