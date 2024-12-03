package com.neuedu.sports.service.impl;
import lombok.RequiredArgsConstructor;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.neuedu.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.neuedu.sports.mapper.SportsAccommodationSchedulingMapper;
import com.neuedu.sports.domain.SportsAccommodationScheduling;
import com.neuedu.sports.service.ISportsAccommodationSchedulingService;

/**
 * 住宿与交通调度-住宿调度Service业务层处理
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsAccommodationSchedulingServiceImpl extends ServiceImpl<SportsAccommodationSchedulingMapper, SportsAccommodationScheduling> implements ISportsAccommodationSchedulingService
{
    private final SportsAccommodationSchedulingMapper sportsAccommodationSchedulingMapper;

    /**
     * 查询住宿与交通调度-住宿调度
     * 
     * @param id 住宿与交通调度-住宿调度主键
     * @return 住宿与交通调度-住宿调度
     */
    @Override
    public SportsAccommodationScheduling selectSportsAccommodationSchedulingById(Long id)
    {
        return sportsAccommodationSchedulingMapper.selectSportsAccommodationSchedulingById(id);
    }

    /**
     * 查询住宿与交通调度-住宿调度列表
     * 
     * @param sportsAccommodationScheduling 住宿与交通调度-住宿调度
     * @return 住宿与交通调度-住宿调度
     */
    @Override
    public List<SportsAccommodationScheduling> selectSportsAccommodationSchedulingList(SportsAccommodationScheduling sportsAccommodationScheduling)
    {
        return sportsAccommodationSchedulingMapper.selectSportsAccommodationSchedulingList(sportsAccommodationScheduling);
    }

    /**
     * 新增住宿与交通调度-住宿调度
     * 
     * @param sportsAccommodationScheduling 住宿与交通调度-住宿调度
     * @return 结果
     */
    @Override
    public int insertSportsAccommodationScheduling(SportsAccommodationScheduling sportsAccommodationScheduling)
    {
        sportsAccommodationScheduling.setCreateTime(DateUtils.getNowDate());
        return sportsAccommodationSchedulingMapper.insertSportsAccommodationScheduling(sportsAccommodationScheduling);
    }

    /**
     * 修改住宿与交通调度-住宿调度
     * 
     * @param sportsAccommodationScheduling 住宿与交通调度-住宿调度
     * @return 结果
     */
    @Override
    public int updateSportsAccommodationScheduling(SportsAccommodationScheduling sportsAccommodationScheduling)
    {
        sportsAccommodationScheduling.setUpdateTime(DateUtils.getNowDate());
        return sportsAccommodationSchedulingMapper.updateSportsAccommodationScheduling(sportsAccommodationScheduling);
    }

    /**
     * 批量删除住宿与交通调度-住宿调度
     * 
     * @param ids 需要删除的住宿与交通调度-住宿调度主键
     * @return 结果
     */
    @Override
    public int deleteSportsAccommodationSchedulingByIds(Long[] ids)
    {
        return sportsAccommodationSchedulingMapper.deleteSportsAccommodationSchedulingByIds(ids);
    }

    /**
     * 删除住宿与交通调度-住宿调度信息
     * 
     * @param id 住宿与交通调度-住宿调度主键
     * @return 结果
     */
    @Override
    public int deleteSportsAccommodationSchedulingById(Long id)
    {
        return sportsAccommodationSchedulingMapper.deleteSportsAccommodationSchedulingById(id);
    }
}
