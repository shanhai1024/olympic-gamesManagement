package com.neuedu.sports.mapper;

import java.util.List;
import com.neuedu.sports.domain.SportsAudienceNavigation;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
/**
 * 住宿与交通调度-观众导航Mapper接口
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Mapper
public interface SportsAudienceNavigationMapper extends BaseMapper<SportsAudienceNavigation>
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
     * 删除住宿与交通调度-观众导航
     * 
     * @param id 住宿与交通调度-观众导航主键
     * @return 结果
     */
    public int deleteSportsAudienceNavigationById(Long id);

    /**
     * 批量删除住宿与交通调度-观众导航
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSportsAudienceNavigationByIds(Long[] ids);
}
