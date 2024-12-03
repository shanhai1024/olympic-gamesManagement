package com.neuedu.sports.mapper;

import java.util.List;
import com.neuedu.sports.domain.SportsEventSchedule;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
/**
 * 赛事管理-赛程规划Mapper接口
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Mapper
public interface SportsEventScheduleMapper extends BaseMapper<SportsEventSchedule>
{
    /**
     * 查询赛事管理-赛程规划
     * 
     * @param id 赛事管理-赛程规划主键
     * @return 赛事管理-赛程规划
     */
    public SportsEventSchedule selectSportsEventScheduleById(Long id);

    /**
     * 查询赛事管理-赛程规划列表
     * 
     * @param sportsEventSchedule 赛事管理-赛程规划
     * @return 赛事管理-赛程规划集合
     */
    public List<SportsEventSchedule> selectSportsEventScheduleList(SportsEventSchedule sportsEventSchedule);

    /**
     * 新增赛事管理-赛程规划
     * 
     * @param sportsEventSchedule 赛事管理-赛程规划
     * @return 结果
     */
    public int insertSportsEventSchedule(SportsEventSchedule sportsEventSchedule);

    /**
     * 修改赛事管理-赛程规划
     * 
     * @param sportsEventSchedule 赛事管理-赛程规划
     * @return 结果
     */
    public int updateSportsEventSchedule(SportsEventSchedule sportsEventSchedule);

    /**
     * 删除赛事管理-赛程规划
     * 
     * @param id 赛事管理-赛程规划主键
     * @return 结果
     */
    public int deleteSportsEventScheduleById(Long id);

    /**
     * 批量删除赛事管理-赛程规划
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSportsEventScheduleByIds(Long[] ids);
}
