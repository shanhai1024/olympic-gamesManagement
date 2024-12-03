package com.neuedu.sports.service.impl;
import lombok.RequiredArgsConstructor;
import java.util.List;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.neuedu.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.neuedu.sports.mapper.SportsAudienceNavigationMapper;
import com.neuedu.sports.domain.SportsAudienceNavigation;
import com.neuedu.sports.service.ISportsAudienceNavigationService;

/**
 * 住宿与交通调度-观众导航Service业务层处理
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsAudienceNavigationServiceImpl extends ServiceImpl<SportsAudienceNavigationMapper, SportsAudienceNavigation> implements ISportsAudienceNavigationService
{
    private final SportsAudienceNavigationMapper sportsAudienceNavigationMapper;

    /**
     * 查询住宿与交通调度-观众导航
     * 
     * @param id 住宿与交通调度-观众导航主键
     * @return 住宿与交通调度-观众导航
     */
    @Override
    public SportsAudienceNavigation selectSportsAudienceNavigationById(Long id)
    {
        return sportsAudienceNavigationMapper.selectSportsAudienceNavigationById(id);
    }

    /**
     * 查询住宿与交通调度-观众导航列表
     * 
     * @param sportsAudienceNavigation 住宿与交通调度-观众导航
     * @return 住宿与交通调度-观众导航
     */
    @Override
    public List<SportsAudienceNavigation> selectSportsAudienceNavigationList(SportsAudienceNavigation sportsAudienceNavigation)
    {
        return sportsAudienceNavigationMapper.selectSportsAudienceNavigationList(sportsAudienceNavigation);
    }

    /**
     * 新增住宿与交通调度-观众导航
     * 
     * @param sportsAudienceNavigation 住宿与交通调度-观众导航
     * @return 结果
     */
    @Override
    public int insertSportsAudienceNavigation(SportsAudienceNavigation sportsAudienceNavigation)
    {
        sportsAudienceNavigation.setCreateTime(DateUtils.getNowDate());
        return sportsAudienceNavigationMapper.insertSportsAudienceNavigation(sportsAudienceNavigation);
    }

    /**
     * 修改住宿与交通调度-观众导航
     * 
     * @param sportsAudienceNavigation 住宿与交通调度-观众导航
     * @return 结果
     */
    @Override
    public int updateSportsAudienceNavigation(SportsAudienceNavigation sportsAudienceNavigation)
    {
        sportsAudienceNavigation.setUpdateTime(DateUtils.getNowDate());
        return sportsAudienceNavigationMapper.updateSportsAudienceNavigation(sportsAudienceNavigation);
    }

    /**
     * 批量删除住宿与交通调度-观众导航
     * 
     * @param ids 需要删除的住宿与交通调度-观众导航主键
     * @return 结果
     */
    @Override
    public int deleteSportsAudienceNavigationByIds(Long[] ids)
    {
        return sportsAudienceNavigationMapper.deleteSportsAudienceNavigationByIds(ids);
    }

    /**
     * 删除住宿与交通调度-观众导航信息
     * 
     * @param id 住宿与交通调度-观众导航主键
     * @return 结果
     */
    @Override
    public int deleteSportsAudienceNavigationById(Long id)
    {
        return sportsAudienceNavigationMapper.deleteSportsAudienceNavigationById(id);
    }
}
