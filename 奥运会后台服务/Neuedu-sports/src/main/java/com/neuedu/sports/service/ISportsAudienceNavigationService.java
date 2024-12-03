package com.neuedu.sports.service;

import java.util.List;
import com.neuedu.sports.domain.SportsAudienceNavigation;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 住宿与交通调度-观众导航Service接口
 * 
 * @author neuedu
 * @date 2024-06-12
 */
public interface ISportsAudienceNavigationService extends IService<SportsAudienceNavigation>
{
    /**
     * 查询住宿与交通调度-观众导航
     * 
     * @param id 住宿与交通调度-观众导航主键
     * @return 住宿与交通调度-观众导航
     */
    public SportsAudienceNavigation selectSportsAudienceNavigationById(Long id);

    /**
     * 查询住宿与交通调度-观众导航列表
     * 
     * @param sportsAudienceNavigation 住宿与交通调度-观众导航
     * @return 住宿与交通调度-观众导航集合
     */
    public List<SportsAudienceNavigation> selectSportsAudienceNavigationList(SportsAudienceNavigation sportsAudienceNavigation);

    /**
     * 新增住宿与交通调度-观众导航
     * 
     * @param sportsAudienceNavigation 住宿与交通调度-观众导航
     * @return 结果
     */
    public int insertSportsAudienceNavigation(SportsAudienceNavigation sportsAudienceNavigation);

    /**
     * 修改住宿与交通调度-观众导航
     * 
     * @param sportsAudienceNavigation 住宿与交通调度-观众导航
     * @return 结果
     */
    public int updateSportsAudienceNavigation(SportsAudienceNavigation sportsAudienceNavigation);

    /**
     * 批量删除住宿与交通调度-观众导航
     * 
     * @param ids 需要删除的住宿与交通调度-观众导航主键集合
     * @return 结果
     */
    public int deleteSportsAudienceNavigationByIds(Long[] ids);

    /**
     * 删除住宿与交通调度-观众导航信息
     * 
     * @param id 住宿与交通调度-观众导航主键
     * @return 结果
     */
    public int deleteSportsAudienceNavigationById(Long id);
}
